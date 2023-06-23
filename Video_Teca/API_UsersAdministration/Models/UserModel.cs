using System.ComponentModel.DataAnnotations.Schema;

namespace API_UsersAdministration.Models
{
    public class UserModel
    {
        public int Id { get; set; }
        public string Username { get; set; } = null!;
        public string Email { get; set; } = null!;
        public string Name { get; set; } = null!;
        
        [NotMapped]
        public byte[] imagen { get; set; } = null!;

        public string? Role { get; set; }
    }
}
