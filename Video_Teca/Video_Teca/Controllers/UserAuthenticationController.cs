using Video_Teca.Models.DTO;
using Video_Teca.Repositories.Abstract;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Video_Teca.Models.Domain;
using Video_Teca.Data;
using Microsoft.IdentityModel.Tokens;
using Video_Teca.Models;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;

namespace Video_Teca.Controllers
{
    public class UserAuthenticationController : Controller
    {
        private VideoTecaDbContext db = new VideoTecaDbContext();
        private readonly IUserAuthenticationService _service;
        public UserAuthenticationController(IUserAuthenticationService service)
        {
            this._service = service;
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
            
            model.Role = "client";
            var result = await _service.RegistrationAsync(model);
            TempData["msg"] = result.Message;

            if (result.StatusCode == 1) {
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

        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(LoginModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            var result = await _service.LoginAsync(model);
            if (result.StatusCode == 1)
            {
                
                TempData["username"] = model.Username;

                var parameter = new List<SqlParameter>();
                parameter.Add(new SqlParameter("@Username", model.Username));

                var role = db.AspNetRoles.FromSqlRaw(@"exec get_role_user @Username", parameter.ToArray()).ToList();
                
                if (role.FirstOrDefault().Name == "superAdmin")
                {
                    return RedirectToAction("UserAdministration", "Admin");
                }

                return RedirectToAction("DisplayClient", "Client");
            }
            else
            {
                TempData["msg"] = result.Message;
                return RedirectToAction(nameof(Login));
            }
        }

        [Authorize]
        
        public async Task<IActionResult> Logout()
        {
            await _service.LogoutAsync();
            return RedirectToAction(nameof(Login));
        }

        public async Task<IActionResult> Reg()
        {
            var model = new RegistrationModel
            {
                UserName = "adminadmin",
                Name = "Super Administrador",
                Email = "cristofer.guanipa@ucr.ac.cr",
                Password = "Lenguajes2023*",
            };
            model.Role = "superAdmin";
            var result = await _service.RegistrationAsync(model);

            string imagePath = "wwwroot/images/img-default.webp"; //Se selecciona la imagen por defecto
            byte[] archivoBytes = System.IO.File.ReadAllBytes(imagePath);

            var parameter = new List<SqlParameter>();
            parameter.Add(new SqlParameter("@Username", model.UserName));
            parameter.Add(new SqlParameter("@Email", model.Email));
            parameter.Add(new SqlParameter("@Name", model.Name));
            parameter.Add(new SqlParameter("@imagen", archivoBytes));

            db.Database.ExecuteSqlRaw(@"exec insert_user @Username, @Email, @Name, @imagen", parameter.ToArray());


            return Ok(result);

        }

        [Authorize]
        [HttpPost]
        public async Task<IActionResult> changePassword(string user, string oldPassword, string newPassword)
        {
            var result = await _service.ChangePasswordAsync(user, oldPassword, newPassword);           
            return Ok(result.Message);

        }

        [Authorize]
        
        public async Task<IActionResult> DeleteAccount(string user)
        {
            await _service.DeleteAccountAsync(user);
            var parameter = new List<SqlParameter>();
            parameter.Add(new SqlParameter("@Username", user));
            

            db.Database.ExecuteSqlRaw(@"exec delete_user @Username", parameter.ToArray());
            return RedirectToAction(nameof(Login));

        }
    }



}

