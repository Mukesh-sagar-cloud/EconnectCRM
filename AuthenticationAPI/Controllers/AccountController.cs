using Entities.Models;
using JWTAuthenticationManager.Models;
using Microsoft.AspNetCore.Mvc;

namespace AuthenticationAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : ControllerBase
    {

        private readonly IAccountService _accountRepository;

        public AccountController(IAccountService accountRepository)
        {
            _accountRepository = accountRepository;
        }

        [HttpPost("Authenticate")]
        public ActionResult<AuthenticationResponse?> Authenticate(AuthenticationRequest authenticationRequest)
        {

            var response = _accountRepository.Authenticate(authenticationRequest);
            if (response == null)
            {
                return BadRequest(new { message = "Username or password is incorrect" });
            }
            else
            {
                return Ok(response);
            }
            
        }
        
        [HttpPost("ForgotPassword")]
        public ActionResult<AuthenticationResponse?> ForgotPassword([FromBody] AuthenticationRequest authenticationRequest)
        {
            //Send EMAIL ON entered email "username": username,
            var response = _accountRepository.Authenticate(authenticationRequest);
            if (response == null)
            {
                return BadRequest(new { message = "Username or password is incorrect" });
            }
            else
            {
                return Ok(response);
            }
        }
        

        [HttpPost("ChangePassword")]
        public ActionResult<AuthenticationResponse?> ChangePassword([FromBody] AuthenticationRequest authenticationRequest)
        {
            //update Password "username":LoginName,"newpassword": NewPassword,
            var response = _accountRepository.Authenticate(authenticationRequest);
            if (response == null)
            {
                return BadRequest(new { message = "Username or password is incorrect" });
            }
            else
            {
                return Ok(response);
            }
        }
    }
}
