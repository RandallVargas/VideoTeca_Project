using Video_Teca.Models.DTO;
using Video_Teca.Repositories.Abstract;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Video_Teca.Models;
using Video_Teca.Data;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using PdfSharp.Drawing;
using PdfSharp.Pdf;
using System;

namespace Video_Teca.Controllers
{
    

    [Authorize(Roles = "admin, superAdmin")]
    public class AdminController : Controller
    {
        private VideoTecaDbContext db = new VideoTecaDbContext();
        private readonly IUserAuthenticationService _service;

        public AdminController(IUserAuthenticationService service)
        {
            this._service = service;
        }
 
        public IActionResult UserAdministration() {

            
            if (TempData.Keys.Count > 0)
            {
                var username = TempData["username"].ToString();
                var user = db.Users.First(x => x.Username == username);
                byte[] imgByte = db.UserImgs.First(y => y.UserID == user.Id).imagen;
                
                ViewBag.UserId = user.Id;
                ViewBag.Username = user.Username;
                ViewBag.ImageBytes = imgByte.ToList();
            }

            var resultado = new List<UserModel>();

            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:7091/api/UserAdministrationService");
                //HTTP GET
                var responseTask = client.GetAsync("");
                responseTask.Wait();

                var result = responseTask.Result;

                if (result.IsSuccessStatusCode)
                {
                    
                    var readTask = result.Content.ReadFromJsonAsync<List<UserModel>>();
                    readTask.Wait();

                    resultado = readTask.Result;

                }
            
             
            }


            if (User.IsInRole("superAdmin"))
            { //Al ser el superAdmin le muestra todos los usuarios menos el
                resultado.Remove(resultado.Where(x => x.Role == "superAdmin").First());
            }
            else { //Los admin solo pueden ver los usuarios 
                resultado.RemoveAll(x => x.Role=="superAdmin" || x.Role == "admin");
            }
                        
            return View(resultado.OrderBy(x => x.Name));
        }

        // GET: PersonController/Details/5
        public ActionResult Details(int id)
        {
            var user = new UserModel();
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:7091/api/UserAdministrationService");
                var responseTask = client.GetAsync("UserAdministrationService/" + id);
                responseTask.Wait();
                var result = responseTask.Result;
                if (result.IsSuccessStatusCode)
                {

                    var readTask = result.Content.ReadFromJsonAsync<UserModel>();
                    readTask.Wait();

                    user = readTask.Result;

                }
            }
            return View(user);
        }

        public IActionResult Registration()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Registration(RegistrationModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            if (model.Role == null)
            {
                model.Role = "client";
            }
                    
            var result = await _service.RegistrationAsync(model);
            TempData["msg"] = result.Message;

            if (result.StatusCode == 1)
            {
                byte[] archivoBytes = null;

                var archivo = Request.Form.Files["ImageData"];
                var files = HttpContext.Request;

                if (archivo != null && archivo.Length > 0) //Si el usuario escoge una imagen
                {
                    var ms = new MemoryStream();
                    archivo.OpenReadStream().CopyTo(ms);
                    archivoBytes = ms.ToArray();

                }
                else
                {
                    string imagePath = "wwwroot/images/img-default.webp"; //Se selecciona la imagen por defecto
                    archivoBytes = System.IO.File.ReadAllBytes(imagePath);
                }
                var parameter = new List<SqlParameter>();
                parameter.Add(new SqlParameter("@Username", model.UserName));
                parameter.Add(new SqlParameter("@Email", model.Email));
                parameter.Add(new SqlParameter("@Name", model.Name));
                parameter.Add(new SqlParameter("@imagen", archivoBytes));

                db.Database.ExecuteSqlRaw(@"exec insert_user @Username, @Email, @Name, @imagen", parameter.ToArray());


            }

            return RedirectToAction(nameof(Registration));
        }

        public IActionResult GeneratePDFReport()
        {

            string procedimiento = "get_users_administration";

            //obtiene todos los usuarios de la bases de datos          
            List<UserModel> usersList = db.Set<UserModel>()
                .FromSqlRaw(procedimiento)
                .ToList();

            if (User.IsInRole("superAdmin"))
            { //Al ser el superAdmin le muestra todos los usuarios menos el
                usersList.Remove(usersList.Where(x => x.Role == "superAdmin").First());
            }
            else
            { //Los admin solo pueden ver los usuarios 
                usersList.RemoveAll(x => x.Role == "superAdmin" || x.Role == "admin");
            }

            using (var document = new PdfDocument())
            {
                var page = document.AddPage();

                var graphics = XGraphics.FromPdfPage(page);

                var fontTitle = new XFont("Arial", 18, XFontStyle.Bold);
                var fontHeader = new XFont("Arial", 13, XFontStyle.Bold);
                var fontBody = new XFont("Arial", 11, XFontStyle.Regular);

                var yPosition = 40;
                var padding = 10;

                XColor customColor = XColor.FromArgb(204,11, 114, 130);
                XSolidBrush background = new XSolidBrush(customColor);
                // Draw Background
                var backgroundRect = new XRect(0, 0, page.Width, page.Height);
                graphics.DrawRectangle(background, backgroundRect);

                
                // Draw Title
                graphics.DrawString("Reporte de usuarios en el sistema", fontTitle, XBrushes.LightGray, new XRect(10, yPosition, page.Width, page.Height), XStringFormats.TopLeft);
                yPosition += 40;

                XColor customColor2 = XColor.FromArgb(1, 49, 73);
                XSolidBrush background2 = new XSolidBrush(customColor2);
                // Draw Table Headers
                graphics.DrawRectangle(background2, new XRect(10, yPosition, page.Width - 20, 20));
                graphics.DrawString("Nombre", fontHeader, XBrushes.White, new XRect(15, yPosition, 150, 20), XStringFormats.TopLeft);
                graphics.DrawString("Usuario", fontHeader, XBrushes.White, new XRect(160, yPosition, 150, 20), XStringFormats.TopLeft);
                graphics.DrawString("Email", fontHeader, XBrushes.White, new XRect(330, yPosition, 200, 20), XStringFormats.TopLeft);
                graphics.DrawString("Rol", fontHeader, XBrushes.White, new XRect(540, yPosition, 200, 20), XStringFormats.TopLeft);
                yPosition += 20;

                XColor customColor3 = XColor.FromArgb(0, 101, 125);
                XSolidBrush background3 = new XSolidBrush(customColor3);
                foreach (var user in usersList)
                {
                    graphics.DrawRectangle(background3, new XRect(10, yPosition, page.Width - 20, 20));
                    graphics.DrawString(user.Name, fontBody, XBrushes.White, new XRect(15, yPosition, 150, 20), XStringFormats.TopLeft);
                    graphics.DrawString(user.Username, fontBody, XBrushes.White, new XRect(160, yPosition, 150, 20), XStringFormats.TopLeft);
                    graphics.DrawString(user.Email, fontBody, XBrushes.White, new XRect(330, yPosition, 200, 20), XStringFormats.TopLeft);
                    graphics.DrawString(user.Role, fontBody, XBrushes.White, new XRect(540, yPosition, 200, 20), XStringFormats.TopLeft);


                    yPosition += 20;
                }

                var memoryStream = new MemoryStream();
                document.Save(memoryStream);
                memoryStream.Position = 0;

                return new FileStreamResult(memoryStream, "application/pdf")
                {
                    FileDownloadName = "ReporteUsuarios.pdf"
                };
            }
        }
    }
}
