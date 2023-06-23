using API_UsersAdministration.Data;
using Microsoft.AspNetCore.Mvc;
using System;

namespace API_UsersAdministration.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserAdministrationServiceController : ControllerBase
    {
        private readonly DatabaseContext _context = new DatabaseContext();

        // GET: api/<PersonServiceController>
        [HttpGet]
        public ActionResult<List<UserModel>> Get()
        {

            try
            {

                return Ok(_context.Person.ToList());
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);

            }
        }

    }
}
