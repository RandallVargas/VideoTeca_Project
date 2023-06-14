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
            
            return View();
        }

        
        public IActionResult Privacy()
        {
            return View();
        }

        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        
    }
}