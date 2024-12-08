using JWTAuthenticationManager.Models;


namespace Entities.Models
{
	public interface IAccountService
	{
        AuthenticationResponse Authenticate(AuthenticationRequest model);
		//Login GetById(int id);
	}
}
