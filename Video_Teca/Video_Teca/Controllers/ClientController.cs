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


            var pelis = new List<MoviesAndSeries>();
            using (var dbContext = new VideoTecaDbContext())
            {
                pelis = dbContext.MoviesAndSeries.ToList();
            }

            var genres = new List<string>();

            using (var dbContext = new VideoTecaDbContext())
            {
                genres = dbContext.Genres.Select(g => g.genre_name).ToList();
            }

            var random = new Random();
            genres = genres.OrderBy(x => random.Next()).ToList();

            var carousels = new List<List<MoviesAndSeries>>();

            int batchSize = (int)Math.Ceiling(genres.Count() / 3.0);
            for (int i = 0; i < genres.Count(); i += batchSize)
            {
                var genreSubset = genres.Skip(i).Take(batchSize).ToList();
                var carousel = pelis.Where(item => db.MovieGenres.Any(mg => mg.movie_id == item.id && genreSubset.Contains(mg.genre_id))).ToList();
                carousels.Add(carousel);
            }

            ViewBag.Carousels = carousels;


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
           // var pelis = new List<MoviesAndSeries>();
            //using (var dbContext = new VideoTecaDbContext())
            //{
            //  pelis= dbContext.MoviesAndSeries.ToList();
            //}

            return View(pelis);
        }

        // GET: ClientController/Details/5
        public ActionResult Details(string id)
        {
            Console.WriteLine(id);

            var movieInfo = db.MoviesAndSeries.Find(id);

            //var genres = db.Genres.FromSqlRaw("EXEC GetGenresByMovieId @MovieId", new SqlParameter("@MovieId", id)).ToList();
            var genres = (from g in db.Genres
                          join mg in db.MovieGenres on g.genre_id equals mg.genre_id
                          where mg.movie_id == id
                          select g.genre_name).ToList();
            ViewBag.Genres = genres;




            //Console.WriteLine(id);
            // Console.WriteLine(movieInfo.title);
            //return View(movieInfo);
            return PartialView("Details",movieInfo);
          
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
                return View("Details");
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
        public void sendComment(string comment, string idUser, string username, string  movieId  )
        {
            Random random = new Random();
            // Console.WriteLine(movieId);
            var comments = new Comment();
            comments.comment_id = random.Next().ToString(); 
            comments.userid = int.Parse(idUser);
            comments.Username = username;
            comments.comment1 = comment;
            comments.movie_series_id = movieId;

            db.Comments.Add(comments);
            db.SaveChanges();

            Console.WriteLine(idUser + "Controllador" + username + ""+comment);
           //db.Comments.Add(new Comment { })
        }
        public IActionResult GetComments(string id)
        {
            var comments = db.Comments.FromSqlRaw("EXEC GetCommentsByMovieId @movieId", new SqlParameter("@movieId", id)).ToList();
            Console.WriteLine(comments);
            return PartialView("CommentsView",comments);
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

