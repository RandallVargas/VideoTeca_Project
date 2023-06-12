using Video_Teca.Models.DTO;

namespace Video_Teca.Repositories.Abstract
{
    public interface IUserAuthenticationService
    {
        Task<Status> LoginAsync(LoginModel model);

        Task<Status> RegistrationAsync(RegistrationModel model);

        Task LogoutAsync();

        Task<StatusPassword> ChangePasswordAsync(string user, string oldPassword, string newPassword);

        Task DeleteAccountAsync(string user);

    }
}
