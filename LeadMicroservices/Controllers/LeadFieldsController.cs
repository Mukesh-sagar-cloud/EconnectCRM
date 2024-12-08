using Azure.Core;
using Entites.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.Design;
using System.Dynamic;
using static LeadMicroservices.Controllers.DynamicControlsController;

namespace LeadMicroservices.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LeadFieldsController : ControllerBase
    {
        [HttpGet("GetLeadFieldByCompanyId")]
        [Authorize]
        public ActionResult<IEnumerable<DynamicControls>> GetLeadFieldByCompanyId(int CompanyId,string ScreenName)
        {
            EconnectContext _context = new EconnectContext();
            var LeadField = _context.DynamicControls
             .Where(lf => lf.CompanyId == CompanyId && lf.ScreenName == ScreenName)
             .ToList();
            return Ok(LeadField);
        }

        [HttpDelete("DeleteLeadFieldById")]
        [Authorize]
        public IActionResult DeleteLeadFieldById(int id)
        {
            EconnectContext _context = new EconnectContext();

            // Find the item by id
            var leadField = _context.DynamicControls.FirstOrDefault(lf => lf.Id == id);

            if (leadField == null)
            {
                return NotFound(new { message = "LeadField not found" });
            }

            // Remove the item
            _context.DynamicControls.Remove(leadField);
            _context.SaveChanges();

            return Ok(new { message = "LeadField deleted successfully" });
        }


        [HttpGet("GetLeadFieldValueByCompanyId")]
        [Authorize]
        public ActionResult<IEnumerable<DynamicControlValues>> GetLeadFieldValueByCompanyId(int companyId)
        {
            EconnectContext _context = new EconnectContext();
            List<DynamicControlValues> LeadFieldValue = _context.DynamicControlValues.ToList();
            return Ok(LeadFieldValue);
        }


        [HttpPost("saveFields")]
        [Authorize]
        public async Task<ActionResult> SaveFields(SaveRequest data)
        {
            using var _context = new EconnectContext();

            // Check if companyId is provided
            if (data.companyId == 0)
            {
                return BadRequest("Company ID is required.");
            }
            int fieldSequence = (int)(await _context.DynamicControls.MaxAsync(x => x.FieldSequence) + 1);
            // Assuming you have a DynamicControl entity
            var dynamicControl = new DynamicControls
            {
                CompanyId = data.companyId,
                ControlType = data.SaveFieldsRequest?.ControlType,
                Label = data.SaveFieldsRequest?.Label,
                IsDisplayInGrid=false,
                FieldSequence= fieldSequence,
                ScreenName=data.ScreenName,
                Options = System.Text.Json.JsonSerializer.Serialize(data.SaveFieldsRequest?.Options) // Serialize options using System.Text.Json
            };

            _context.DynamicControls.Add(dynamicControl);

            // Save changes to the database
            await _context.SaveChangesAsync();

            return Ok(new { message = "Dynamic control saved successfully" });
        }

        // Request classes
        public class SaveRequest
        {
            public SaveFieldsRequest? SaveFieldsRequest { get; set; }
            public int companyId { get; set; }
            public string? ScreenName { get; set; }
        }

        public class SaveFieldsRequest
        {
            public string? ControlType { get; set; }
            public string? Label { get; set; }
            public List<Option>? Options { get; set; } // Corrected type
        }

        // Model for options in dropdowns
        public class Option
        {
            public string Text { get; set; }
            public string Value { get; set; }
        }

        //public class ListText
        //{
        //    public string? text { get; set; }
        //    public string? value { get; set; }
        //}


    }
}
