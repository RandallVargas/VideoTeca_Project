﻿using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Video_Teca.Data;
using Video_Teca.Models;

namespace Video_Teca.Controllers
{
    public class ClientController : Controller
    {
        private VideoTecaDbContext db = new VideoTecaDbContext();
        // GET: ClientController
        public ActionResult DisplayClient()
        {
            var pelis = new List<MoviesAndSeries>();
            using (var dbContext = new VideoTecaDbContext())
            {
              pelis= dbContext.MoviesAndSeries.ToList();
            }
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


        public IActionResult GetMovieInfo(string id)
        {
            // Aquí debes escribir la lógica para obtener la información detallada de la película
            // basada en el ID proporcionado. Por ejemplo, puedes consultar la base de datos
            // o algún otro origen de datos para obtener los detalles de la película.

            // Supongamos que tienes una variable llamada 'movieInfo' que contiene los detalles de la película.
            var movieInfo = db.MoviesAndSeries.FirstOrDefault(m => m.id .Equals( id));
            Console.WriteLine(movieInfo.id);
            // Retornar la vista parcial '_MovieInfoPartial' con el modelo de la película.
            return PartialView("MoviesInfoPartial", movieInfo);
        }

        private MoviesAndSeries GetMovieDetailsFromDatabase(string id)
        {
            // Aquí debes implementar la lógica para obtener los detalles de la película
            // desde la base de datos o cualquier otra fuente de datos.
            // Retorna un objeto de tipo MoviesAndSeries con los detalles de la película.
            Console.Write(id);
            // Ejemplo de código:
            var movie = db.MoviesAndSeries.FirstOrDefault(m => m.id == id);
            return movie;
        }
    }
  
}

