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

                Task.Run(() => db.Database.ExecuteSqlRaw(@"exec insert_user @Username, @Email, @Name, @imagen", parameter.ToArray()));
                

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
                //var resultDb = db.Users.First(x =>x.Username==model.Username );
                //var imgUser = db.UserImgs.First(x=> x.UserID==resultDb.Id);
                
                //UserModel userView = new UserModel();
                //userView.Id = resultDb.Id;
                //userView.Name = resultDb.Name;
                //userView.Username = resultDb.Username;
                //userView.Email = resultDb.Email;
                //userView.imagen = imgUser.imagen;
                //Hacer la busqueda del user y retornarlo
                return RedirectToAction("Index", "Home");
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

        /*public async Task<IActionResult> Reg()
        {
            var model = new RegistrationModel
            {
                UserName = "admin_c",
                Name = "Cristofer-Guanipa",
                Email = "cristofer@gmail.com",
                Password = "Admin2023*",
            };
            model.Role = "admin";
            var result = await _service.RegistrationAsync(model);
            return Ok(result);

        }*/
    }



}

