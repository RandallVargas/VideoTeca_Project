using System.ComponentModel.DataAnnotations.Schema;

namespace Video_Teca.Models
{
    public class UserModel
    {
        public int Id { get; set; }
        public string Username { get; set; } = null!;
        public string Email { get; set; } = null!;
        public string Name { get; set; } = null!;
        
        [NotMapped]
        public byte?[] imagen { get; set; }

        public string? Role { get; set; }
    }
}
