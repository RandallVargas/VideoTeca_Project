using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Data;
using Video_Teca.Data;
using Video_Teca.Models;
using Video_Teca.Repositories.Abstract;

namespace Video_Teca.Controllers
{
    [Authorize(Roles = "admin, superAdmin")]
    public class MovSerAdminController : Controller
    {
        private  VideoTecaDbContext db = new VideoTecaDbContext();
        
        // GET: MovSerAdmin
        public ActionResult  AdminMovSer()
        {

            if (TempData.Keys.Count > 0)
            {
                var username = TempData["username"].ToString();
                var user = db.Users.First(x => x.Username == username);
                byte[] imgByte = db.UserImgs.First(y => y.UserID == user.Id).imagen;

                ViewBag.UserId = user.Id;
                ViewBag.Username = user.Username;
                ViewBag.ImageBytes = imgByte.ToList();

            }
         
            var msList = new List<MoviesAndSeries>();
            msList = db.MoviesAndSeries.FromSqlRaw("exec GetAllMoviesAndSeries").ToList();

            return View(msList);
          
        }

        // GET: MovSerAdmin/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: MovSerAdmin/Create
        public ActionResult Create()
        {
            ViewBag.Generos = db.Genres.ToList(); 

            return View();
        }

        // POST: MovSerAdmin/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(MoviesAndSeries mvs)
        {
            db.MoviesAndSeries.Add(mvs);
            db.SaveChanges();
                return View();
            
        }

        // GET: MovSerAdmin/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: MovSerAdmin/Edit/5
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

        // GET: MovSerAdmin/Delete/5
        public ActionResult Delete(string id)
        {
            return View();
        }

        // POST: MovSerAdmin/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(string id, MoviesAndSeries mvs)
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
        public async Task<IActionResult> DeleteMS(string id)
        {
            var ms = db.MoviesAndSeries.FindAsync(id);
           // await db.MoviesAndSeries.Remove(ms);
            //var parameter = new List<SqlParameter>();
            //parameter.Add(new SqlParameter("@Username", id));

            Console.WriteLine("Soy DeleteMS");
            //db.Database.ExecuteSqlRaw(@"exec delete_user @Username", parameter.ToArray());
            return Ok();
        }
        public ActionResult AddCaps(string id)
        {
            ViewBag.MovieSeriesId = id;
            return View();
        }

        // POST: MovSerAdmin/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddCaps(string id, Episode eps)
        {
           //var ep = eps.episode_id;
            //var episodio = db.Episodes.Find(ep);
           // if (episodio == null)
           // {
                var parameter = new List<SqlParameter>();
                parameter.Add(new SqlParameter("@episode_id", eps.episode_id));
                parameter.Add(new SqlParameter("@title", eps.title));
                parameter.Add(new SqlParameter("@duration", eps.duration));

                int episodeNumber = eps.episode_number ?? 0; // Si eps.episode_number es nulo, se asigna 0 como valor predeterminado
                parameter.Add(new SqlParameter("@episode_number", episodeNumber));

                int seasonNumber = eps.season_number ?? 0; // Si eps.season_number es nulo, se asigna 0 como valor predeterminado
                parameter.Add(new SqlParameter("@season_number", seasonNumber));

                parameter.Add(new SqlParameter("@movie_series_id", eps.movie_series_id));

                db.Database.ExecuteSqlRaw("exec InsertEpisode @episode_id, @title, @duration, @episode_number, @season_number, @movie_series_id", parameter.ToArray()); //db.Episodes.Add(eps);

           // }
            //db.SaveChanges();


            return View();
            
        }
    }
}
