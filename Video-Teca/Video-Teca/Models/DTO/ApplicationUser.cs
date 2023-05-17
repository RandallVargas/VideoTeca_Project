using Microsoft.AspNetCore.Identity;

namespace Video_Teca.Models.DTO
{
    public class ApplicationUser : IdentityUser
    {
        public string Name { get; set; }
        public string? ProfilePicture { get; set; }
    }
}
