using Entites.Models;
using LeadMicroservices.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.Design;
using System.Dynamic;

namespace LeadMicroservices.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EventController : ControllerBase
    {
        [HttpGet("GetEventListByCompanyId")]
        [Authorize]
        public async Task<ActionResult<IEnumerable<EventFull>>> GetEventListByCompanyId(int CompanyId)
        {
            EconnectContext _context = new EconnectContext();

            var events = await _context.EventFull
                                    .FromSqlRaw("EXEC GetEventListByCompanyId @CompanyId = {0}", CompanyId)
                                    .ToListAsync();
            return Ok(events);
        }

        [HttpGet("GetLeadContactListByLeadId")]
        [Authorize]
        public async Task<ActionResult> GetLeadContactListByLeadId(int leadId)
        {
            EconnectContext _context = new EconnectContext();

            var lead = await _context.GetAllLeadContactListByLeadId
                                    .FromSqlRaw("EXEC GetLeadContactListByLeadId @LeadId = {0}", leadId)
                                    .ToListAsync();
            return Ok(lead);


        }


        [HttpPost("AddNewContact")]
        [Authorize]
        public IActionResult AddNewContact(AddNewContactRequest request)
        {
            EconnectContext _context = new EconnectContext();
            request.AddLeadContactModels.CompanyId = request.CompanyId;
            if (request.AddLeadContactModels.FirstName == null)
            {
                return BadRequest("LeadContactList data is null.");
            }
            _context.LeadContactList.Add(request.AddLeadContactModels);
            // Save changes to the database
            _context.SaveChanges();

            return Ok(new { message = "Values stored successfully" });
        }

        [HttpPut("UpdateLeadContactList")]
        [Authorize]
        public IActionResult UpdateLeadContactList(AddNewContactRequest updatedContact)
        {
            EconnectContext _context = new EconnectContext();
            var updatemodal = updatedContact.AddLeadContactModels;
            if (updatedContact == null)
            {
                return BadRequest("LeadContactList data is null.");
            }

            var existingContact = _context.LeadContactList.FirstOrDefault(l => l.LeadContactListId == updatemodal.LeadContactListId);

            if (existingContact == null)
            {
                return NotFound($"LeadContactList with ID {updatemodal.LeadContactListId} not found.");
            }

            // Update the properties
            existingContact.CompanyId = updatedContact.CompanyId;
            existingContact.Salutation = updatemodal.Salutation;
            existingContact.Relationship = updatemodal.Relationship;
            existingContact.FirstName = updatemodal.FirstName;
            existingContact.LastName = updatemodal.LastName;
            existingContact.Gender = updatemodal.Gender;
            existingContact.Address = updatemodal.Address;
            existingContact.City = updatemodal.City;
            existingContact.State = updatemodal.State;
            existingContact.PostCode = updatemodal.PostCode;
            existingContact.Email = updatemodal.Email;
            existingContact.MobilePhone = updatemodal.MobilePhone;
            existingContact.HomePhone = updatemodal.HomePhone;
            existingContact.WorkPhone = updatemodal.WorkPhone;
            existingContact.ReceiveMail = updatemodal.ReceiveMail;
            existingContact.ReceiveEmail = updatemodal.ReceiveEmail;
            existingContact.ReceiveSMS = updatemodal.ReceiveSMS;
            existingContact.Alumni = updatemodal.Alumni;
            existingContact.GraduationYear = updatemodal.GraduationYear;
            existingContact.NameAtSchool = updatemodal.NameAtSchool;

            // Save changes to the database
            _context.SaveChanges();

            return Ok(new { message = "LeadContactList updated successfully" });
        }


        public class AddNewContactRequest
        {
            public LeadContactList AddLeadContactModels { get; set; }
            public int CompanyId { get; set; }
        }

    }
}
