using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Video_Teca.Data;
using Video_Teca.Models;
//using Video_Teca.Models.Users;

namespace Video_Teca.Controllers
{
    public class ClientController : Controller
    {
        private VideoTecaDbContext db = new VideoTecaDbContext();

        // GET: ClientController
        
        //[ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        
        public ActionResult DisplayClient()
        {
            if (TempData.Keys.Count > 0)
            {
                var username = TempData["username"].ToString();
                var user = db.Users.First(x => x.Username == username);
                byte[] imgByte = db.UserImgs.First(y => y.UserID == user.Id).imagen;
                //var img = getImage(imgByte);
                ViewBag.UserId = user.Id;
                ViewBag.Username = user.Username;
                ViewBag.ImageBytes = imgByte.ToList();
            }


            //var username = localStorage.getItem('username');
            //var client = db.Users.Find();
            //Console.WriteLine(db.Users.Find("Vargas13"));
            var pelis = new List<MoviesAndSeries>();
            //using (var dbContext = new VideoTecaDbContext())
            //{
            //  pelis= dbContext.MoviesAndSeries.ToList();
            //}
            return View(pelis);
        }

        // GET: ClientController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: ClientController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ClientController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: ClientController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: ClientController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: ClientController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: ClientController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        public IActionResult Profile()
        {
            return View();
        }



        public IActionResult GetMovieInfo(string id)
        {
           
            var movieInfo = db.MoviesAndSeries.Find(id); //Busca la pelicula para mostrar los datos necesarios en el popup
            //Console.WriteLine(movieInfo.id);
            // Retornar la vista parcial 'MovieInfoPartial' con el modelo de la película.
            return PartialView("MoviesInfoPartial", movieInfo);
        }
        public void sendComment()
        {
            
           //db.Comments.Add(new Comment { })
        }


        public byte[] getBytesImage(int id)
        {
            byte[] imgByte = db.UserImgs.First(y => y.UserID == id).imagen;
            return imgByte;
        }

        public int UploadUserImage(int id, byte[] imgBytes)
        {

            if (imgBytes.Length > 4194304)
            {
                return -1;
            }

            try
            {
                var parameter = new List<SqlParameter>();
                parameter.Add(new SqlParameter("@Id", id));
                parameter.Add(new SqlParameter("@imagen", imgBytes));

                db.Database.ExecuteSqlRaw(@"exec UpdateImage @Id, @imagen", parameter.ToArray());
                db.SaveChanges();

                return 1;
            }
            catch
            {
                return 0;
            }
        }

        public User getUserData(int id)
        {

            User usuario = db.Users.First(x => x.Id == id);
            return usuario;
        }

        public int changeEmail(int id, string email)
        {

            try
            {
                var parameter = new List<SqlParameter>();
                parameter.Add(new SqlParameter("@Id", id));
                parameter.Add(new SqlParameter("@email", email));

                db.Database.ExecuteSqlRaw(@"exec changeEmail @Id, @email", parameter.ToArray());
                db.SaveChanges();

                return 1;
            }
            catch
            {
                return -1;
            }

        }
    }
  
}

