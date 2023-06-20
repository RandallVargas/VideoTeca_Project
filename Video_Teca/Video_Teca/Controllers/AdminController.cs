using Video_Teca.Models.DTO;
using Video_Teca.Repositories.Abstract;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Video_Teca.Models;
using Video_Teca.Data;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

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

            string procedimiento = "get_users_administration";
            
            //obtiene todos los usuarios de la bases de datos          
            List<UserModel> resultados = db.Set<UserModel>()
                .FromSqlRaw(procedimiento)
                .ToList();

            if (User.IsInRole("superAdmin"))
            { //Al ser el superAdmin le muestra todos los usuarios menos el
                resultados.Remove(resultados.Where(x => x.Role == "superAdmin").First());
            }
            else { //Los admin solo pueden ver los usuarios 
                resultados.RemoveAll(x => x.Role=="superAdmin" || x.Role == "admin");
            }
                        
            return View(resultados.OrderBy(x => x.Name));
        }

        // GET: PersonController/Details/5
        public ActionResult Details(int id)
        {
            var parameter = new List<SqlParameter>();
            parameter.Add(new SqlParameter("@Id", id));

            string procedimiento = @"exec get_user_details_administration @Id";

            //obtiene todos los usuarios de la bases de datos          
            var resultado = db.Set<UserModel>()
                .FromSqlRaw(procedimiento, parameter.ToArray())
                .ToList().First();
            resultado.imagen = db.UserImgs.First(x => x.UserID == resultado.Id).imagen;
            return View(resultado);
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
    }
}
