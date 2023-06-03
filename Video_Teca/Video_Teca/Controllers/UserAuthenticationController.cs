using Video_Teca.Models.DTO;
using Video_Teca.Repositories.Abstract;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Video_Teca.Models.Domain;
using Video_Teca.Data;
using Microsoft.IdentityModel.Tokens;

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
                string imageUrl = "./../images/img-default.webp";
                TempData["img-url"] = imageUrl;
                
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

