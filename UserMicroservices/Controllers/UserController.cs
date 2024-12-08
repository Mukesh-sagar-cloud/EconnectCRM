using Entites.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace UserMicroservices.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        [HttpGet("GetUserFullData")]
        [Authorize]
        public ActionResult<IEnumerable<Login>> GetUserFullData()
        {
            EconnectContext _context = new EconnectContext();
            List<Login> user = _context.Logins.ToList();
            return Ok(user);
        }
    }
}
