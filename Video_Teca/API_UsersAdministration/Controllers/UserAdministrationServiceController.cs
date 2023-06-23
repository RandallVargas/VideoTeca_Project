using API_UsersAdministration.Data;
using API_UsersAdministration.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;

namespace API_UsersAdministration.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserAdministrationServiceController : ControllerBase
    {
        private DatabaseContext _context = new DatabaseContext();

        // GET: api/<PersonServiceController>
        [HttpGet]
        public ActionResult<List<UserModel>> Get()
        {

            try
            {
                string procedimiento = "get_users_administration";

                //obtiene todos los usuarios de la bases de datos          
                List<UserModel> resultados = _context.Set<UserModel>()
               .FromSqlRaw(procedimiento)
               .ToList();

                return Ok(resultados);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }


        [HttpGet("{id}")]
        //[Route("getperson")]
        public ActionResult<UserModel> Get(int id)
        {
            try
            {
                var parameter = new List<SqlParameter>();
                parameter.Add(new SqlParameter("@Id", id));

                string procedimiento = @"exec get_user_details_administration @Id";

                //obtiene todos los usuarios de la bases de datos          
                var resultado = _context.Set<UserModel>()
                    .FromSqlRaw(procedimiento, parameter.ToArray())
                    .ToList().First();
                resultado.imagen = _context.UserImgs.First(x => x.UserID == resultado.Id).imagen;

                return Ok(resultado);

            }
            catch (Exception ex)
            {

                return NotFound(ex.Message);

            }
        }       
    }
}
