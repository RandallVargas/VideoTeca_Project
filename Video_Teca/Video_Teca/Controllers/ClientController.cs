using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Data;
using System.Dynamic;
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

            ///////////////////////////////////////
            var pelisRecientes = new List<MoviesAndSeries>();
            var pelisGenero1 = new List<MoviesAndSeries>();
            var pelisGenero2 = new List<MoviesAndSeries>();
            var pelisGenero3 = new List<MoviesAndSeries>();
            var gns = new List<Genre>();

            using (var dbContext = new VideoTecaDbContext())
            {
               
                pelisRecientes = dbContext.MoviesAndSeries.FromSqlRaw("EXEC GetRecentMovies").ToList();
                // Obtener dos géneros aleatorios
                var generos = dbContext.Genres.ToList();
                var random = new Random();
                var generosAleatorios = generos.OrderBy(x => random.Next()).Take(3).ToList();

                // Obtener películas para cada género aleatorio
                var genreId1 = generosAleatorios[0].genre_id;
                var genreId2 = generosAleatorios[1].genre_id;
                var genreId3 = generosAleatorios[2].genre_id;
                var genreName1 = generosAleatorios[0].genre_name;
                var genreName2 = generosAleatorios[1].genre_name;
                var genreName3 = generosAleatorios[2].genre_name;
                ViewBag.GenreName1 = genreName1;
                ViewBag.GenreName2 = genreName2;
                ViewBag.GenreName3 = genreName3;

                pelisGenero1 = dbContext.MoviesAndSeries.FromSqlRaw("EXEC GetMoviesByGenre @GenreId", new SqlParameter("@GenreId", genreId1)).ToList();
                pelisGenero2 = dbContext.MoviesAndSeries.FromSqlRaw("EXEC GetMoviesByGenre @GenreId", new SqlParameter("@GenreId", genreId2)).ToList();
                pelisGenero3 = dbContext.MoviesAndSeries.FromSqlRaw("EXEC GetMoviesByGenre @GenreId", new SqlParameter("@GenreId", genreId3)).ToList();
            }
            ViewBag.PelisRecientes = pelisRecientes;
            ViewBag.PelisGenero1 = pelisGenero1;
            ViewBag.PelisGenero2 = pelisGenero2;
            ViewBag.PelisGenero3 = pelisGenero3;
            return View();
           // return View(pelis);
        }

        // GET: ClientController/Details/5
        public ActionResult Details(string id)
        {
            Console.WriteLine(id);
            var movieSeriesIdParameter = new SqlParameter("movieSeriesId", id);
            var movieInfo = db.MoviesAndSeries.Find(id);

            //var genres = db.Genres.FromSqlRaw("EXEC GetGenresByMovieId @MovieId", new SqlParameter("@MovieId", id)).ToList();
            var genres = (from g in db.Genres
                          join mg in db.MovieGenres on g.genre_id equals mg.genre_id
                          where mg.movie_id == id
                          select g.genre_name).ToList();
            ViewBag.Genres = genres;

            var actor = (from a in db.Actors
                         join ma in db.MovieActors on a.actor_id equals ma.actor_id
                         where ma.movie_id == id
                         select a.actor_first_name).ToList();


             ViewBag.actor = actor;

            if (movieInfo.media_type == "series")
            {
              
                var episodes = db.Episodes.FromSqlRaw("EXEC GetEpisodesBySeries @seriesId", new SqlParameter("@seriesId", id)).ToList();
                ViewBag.episodes = episodes;
            }
           var averageRating = GetAverageRating(id);


            ViewBag.averageRating = averageRating;

          

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
        public void SaveRating(string movieSeriesId, string userId, int rating)
        {
            var movieSeriesIdParameter = new SqlParameter("@movieSeriesId", movieSeriesId);
            var userIdParameter = new SqlParameter("@userId", userId);
            var ratingParameter = new SqlParameter("@rating", rating);
           

            db.Database.ExecuteSqlRaw("EXEC SaveOrUpdateRating @movieSeriesId, @userId, @rating",
                                            movieSeriesIdParameter, userIdParameter, ratingParameter);
      


        }
        public decimal GetAverageRating(string movieSeriesId)
        {
            var movieSeriesIdParameter = new SqlParameter("@movieSeriesId", movieSeriesId);
            var averageRatingParameter = new SqlParameter("@averageRating", SqlDbType.Decimal);
            averageRatingParameter.Precision = 10;
            averageRatingParameter.Scale = 2;
            averageRatingParameter.Direction = ParameterDirection.Output;

            db.Database.ExecuteSqlRaw("EXEC GetAverageRating @movieSeriesId, @averageRating OUTPUT",
                                        movieSeriesIdParameter, averageRatingParameter);

            var averageRating = averageRatingParameter.Value; // Obtener el valor de averageRatingParameter

            if (averageRating != DBNull.Value)
            {
                var averageRatingValue = (decimal)averageRating;
                // Hacer algo con averageRatingValue
                return averageRatingValue;
            }
            return 0;
        }

        public IActionResult GetComments(string id)
        {
            var comments = db.Comments.FromSqlRaw("EXEC GetCommentsByMovieId @movieId", new SqlParameter("@movieId", id)).ToList();
            Console.WriteLine(comments);
            return PartialView("CommentsView", comments);
        }
        public IActionResult GetActors(string id)
        {
            var actors = db.Actors.FromSqlRaw("EXEC GetActorsByMovie @movieId", new SqlParameter("@movieId", id)).ToList();
            Console.WriteLine(actors);
            return PartialView("CommentsView", actors);
        }
        public IActionResult GetContent(string id, string type)
        {
            dynamic model = new ExpandoObject();

            if (type == "actors")
            {
                var actors = db.Actors.FromSqlRaw("EXEC GetActorsByMovie @movieId", new SqlParameter("@movieId", id)).ToList();
                model.Type = "actors";
                model.Actors = actors;
            }
            else if (type == "reviews")
            {
                var comments = db.Comments.FromSqlRaw("EXEC GetCommentsByMovieId @movieId", new SqlParameter("@movieId", id)).ToList();
                model.Type = "comments";
                model.Comments = comments;
            }

            return PartialView("ContentViewPartial", model);
        }
        public IActionResult GetSearch(string searchText)
        {
          var results = db.MoviesAndSeries
                 .Where(m => m.title.Contains(searchText))
                .ToList();

            return PartialView("SearchResultsPartial", results);
        }
        public IActionResult FilterByGenres(string[] genres)
        {
            string genreList = string.Join(",", genres);

            var results = db.MoviesAndSeries
                .FromSqlRaw("EXEC GetMoviesByGenres @Genres", new SqlParameter("@Genres", genreList))
                .ToList();
            return PartialView("SearchResultsPartial", results);
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

