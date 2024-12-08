using Entites.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CompanyMicroservices.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CompanyController : ControllerBase
    {
        public class Customer
        {
            public int Id { get; set; }
            public string Name { get; set; }
            public string Email { get; set; }
            public string PhoneNumber { get; set; }
            public string Address { get; set; }
        }
        [HttpGet]
        [Authorize]
        public ActionResult<IEnumerable<Customer>> GetCustomers()
        {
            var customers = new List<Customer>
            {
                new Customer { Id = 1, Name = "John Doe", Email = "john.doe@example.com", PhoneNumber = "123-456-7890", Address = "123 Elm Street" },
                new Customer { Id = 2, Name = "Jane Smith", Email = "jane.smith@example.com", PhoneNumber = "987-654-3210", Address = "456 Oak Avenue" },
                new Customer { Id = 3, Name = "James Brown", Email = "james.brown@example.com", PhoneNumber = "456-789-1230", Address = "789 Pine Road" }
            };

            return Ok(customers);
        }

        [HttpGet("GetCompanyFullData")]
        [Authorize]
        public ActionResult<IEnumerable<Company>> GetCompanyFullData()
        {
            EconnectContext _context = new EconnectContext();
            List<Company> company = _context.Companies.ToList();
            return Ok(company);
        }

       

    }
}
