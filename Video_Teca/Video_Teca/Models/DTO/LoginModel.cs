using System.ComponentModel.DataAnnotations;

namespace Video_Teca.Models.DTO
{
    public class LoginModel
    {
        [Required]
        public string Username {set; get; }
        [Required]
        public string Password { set; get; }


    }
}
