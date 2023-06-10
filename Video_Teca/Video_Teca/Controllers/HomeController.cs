using Microsoft.AspNetCore.Hosting.Server;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Imaging;
using Video_Teca.Data;
using Video_Teca.Models;
using Video_Teca.Models.DTO;
namespace Video_Teca.Controllers
{
    public class HomeController : Controller
    {
        private VideoTecaDbContext db = new VideoTecaDbContext();


        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {       
            if (TempData.Keys.Count>0)
            {
                var username = TempData["username"].ToString();
                var user = db.Users.First(x => x.Username == username);
                byte[] imgByte = db.UserImgs.First(y => y.UserID == user.Id).imagen;
                //var img = getImage(imgByte);
                ViewBag.UserId= user.Id;
                ViewBag.Username = user.Username;
                ViewBag.ImageBytes = imgByte.ToList();
            }
            return View();
        }

        //public ActionResult Index(UserModel user) 
        //{
        //    return View(user);
        //}

        public IActionResult Profile()
        {
            ////UserModel userview = new UserModel();
            ////var userdb = 
            ////string imageUrl = "./../images/img-default.webp";
            ////ViewBag.ImageUrl = imageUrl;
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        public ActionResult getImage(byte[] imgBytes)
        {
            imgBytes = db.UserImgs.First(y => y.UserID == 2).imagen;

            return File(imgBytes, "image/webp");

        }

        public byte[] getBytesImage(int id) {
            byte[] imgByte = db.UserImgs.First(y => y.UserID == id).imagen;
            return imgByte;
        }

        public int UploadUserImage(int id, byte[] imgBytes) {

            if (imgBytes.Length > 4194304) {
                return -1;
            }

            try {
                var parameter = new List<SqlParameter>();
                parameter.Add(new SqlParameter("@Id", id));
                parameter.Add(new SqlParameter("@imagen", imgBytes));

                var result = Task.Run(() => db.Database.ExecuteSqlRaw(@"exec UpdateImage @Id, @imagen", parameter.ToArray()));
                db.SaveChangesAsync();

                return 1;
            }
            catch {
                return 0;
            }         
        }

        public User getUserData(int id) {

            User usuario = db.Users.First(x => x.Id == id);
            return usuario;
        }

        public string changeEmail(int id, string email) {

            try
            {
                var parameter = new List<SqlParameter>();
                parameter.Add(new SqlParameter("@Id", id));
                parameter.Add(new SqlParameter("@email", email));

                var result = Task.Run(() => db.Database.ExecuteSqlRaw(@"exec changeEmail @Id, @email", parameter.ToArray()));
                db.SaveChangesAsync();

                return "Correo Actualzado Correctamente";
            }
            catch
            {
                return "Error al actualizar el correo";
            }
            
        }
    }
}