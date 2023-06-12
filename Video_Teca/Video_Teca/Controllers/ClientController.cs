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
        public ActionResult DisplayClient()
        {
         
            //var username = localStorage.getItem('username');
            //var client = db.Users.Find();
            //Console.WriteLine(db.Users.Find("Vargas13"));
            var pelis = new List<MoviesAndSeries>();
            using (var dbContext = new VideoTecaDbContext())
            {
              pelis= dbContext.MoviesAndSeries.ToList();
            }
            return View(pelis);
        }

        // GET: ClientController/Details/5
        public ActionResult Details(string id)
        {
            Console.WriteLine(id);

            var movieInfo = db.MoviesAndSeries.Find(id);
           
            //var genres = db.Genres.FromSqlRaw("EXEC GetGenresByMovieId @MovieId", new SqlParameter("@MovieId", id)).ToList();
            //var genres = (from g in db.Genres
            //              join mg in db.MovieGenres on g.genre_id equals mg.genre_id
            //              where mg.movie_id == id
            //              select g.genre_name).ToList();
            //ViewBag.Genres = genres;




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


    }
  
}

