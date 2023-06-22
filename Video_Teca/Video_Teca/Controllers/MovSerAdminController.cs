using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Data;
using Video_Teca.Data;
using Video_Teca.Models;

namespace Video_Teca.Controllers
{
    [Authorize(Roles = "admin, superAdmin")]
    public class MovSerAdminController : Controller
    {
        private VideoTecaDbContext db = new VideoTecaDbContext();
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
            /*var personList = new List<tb_Person>();
      /using (var dbContext = new TestUCRContext())
       {
         personList = dbContext.Person.ToList();
       }
       personList= db.Person.FromSqlRaw("exec dbo.GetPerson").ToList();*/
            var msList = new List<MoviesAndSeries>();
            msList = db.MoviesAndSeries.FromSqlRaw("exec GetAllMoviesAndSeries").ToList();

            return View(msList);
            return View();
        }

        // GET: MovSerAdmin/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: MovSerAdmin/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: MovSerAdmin/Create
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
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: MovSerAdmin/Delete/5
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
    }
}
