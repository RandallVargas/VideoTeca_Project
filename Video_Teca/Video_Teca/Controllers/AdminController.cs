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

            var usuariosFinal = new List<UserModel>();

            var usuarios = db.Users.ToList();

            
            foreach (var user in usuarios) {

                var userModel = new UserModel
                {
                    Id = user.Id,
                    Username = user.Username,
                    Email = user.Email,
                    Name = user.Name,
                    
            };
                usuariosFinal.Add(userModel);
            }

            string procedimiento = "get_users_administration";
            // Pasa los parámetros necesarios al procedimiento almacenado
         
            // Ejecuta el procedimiento almacenado y obtén los resultados
            List<UserModel> resultados = db.Set<UserModel>()
                .FromSqlRaw(procedimiento)
                .ToList();

            resultados.Remove(resultados.Where(x => x.Role=="superAdmin").First());
            
            return View(resultados.OrderBy(x => x.Name));
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
            model.Role = "admin";

            
            var result = await _service.RegistrationAsync(model);
            TempData["msg"] = result.Message;
            return RedirectToAction(nameof(Registration));
        }
    }
}
