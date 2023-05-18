using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Video_Teca.Models.DTO;

namespace Video_Teca.Models.Domain
{
   
        public class DatabaseContext : IdentityDbContext<ApplicationUser>
        {
            public DatabaseContext(DbContextOptions<DatabaseContext> options) : base(options) { }
        }
   
}