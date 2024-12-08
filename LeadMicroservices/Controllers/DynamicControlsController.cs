using Entites.Models;
using LeadMicroservices.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.Design;
using System.Dynamic;
using System.Reflection;

namespace LeadMicroservices.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DynamicControlsController : ControllerBase
    {
        [HttpGet("GetControls")]
        [Authorize]
        public async Task<ActionResult<IEnumerable<DynamicControls>>> GetControls(int CompanyId, string ScreenName)
        {
            EconnectContext _context = new EconnectContext();
            var controls = await _context.DynamicControls
                  .Where(lf => lf.CompanyId == CompanyId && lf.ScreenName == ScreenName).ToListAsync();
            return Ok(controls);
        }

        [HttpGet("GetControlForEditWithValue")]
        public async Task<ActionResult> GetControlForEditWithValue(int leadid,int companyid,string ScreenName)
        {
            using var _context = new EconnectContext();

            var controlsWithValues = await _context.DynamicControls
                .Where(control => control.CompanyId == companyid && control.ScreenName==ScreenName)
                .Select(control => new
                {
                    control.Id,
                    control.Label,
                    control.ControlType,
                    Value = _context.DynamicControlValues
                                    .Where(valu => valu.ControlId == control.Id && valu.LeadId == leadid)
                                    .Select(valu => valu.Value)
                                    .FirstOrDefault(),
                    control.Options
                })
                .ToListAsync();

            if (controlsWithValues == null || !controlsWithValues.Any())
            {
                return NotFound();
            }

            return Ok(controlsWithValues);
        }




        [HttpPost("saveDynamicValues")]
        [Authorize]
        public async Task<ActionResult> PostControlValues(AddNewSaveLeadRequest data)
        {
            using var _context = new EconnectContext();

            if (data.leaddata == null || data.leaddata.Count == 0)
            {
                return BadRequest("Control values are empty");
            }

            // Save Dynamic Control Values
            int? maxLeadId = await _context.DynamicControlValues.MaxAsync(x => (int?)x.LeadId);
            int leadId = (maxLeadId ?? 0) + 1;

            foreach (var value in data.leaddata)
            {
                value.LeadId = leadId;
                _context.DynamicControlValues.Add(value);
            }

            // Save Contacts
            if (data.contacts != null && data.contacts.Count > 0)
            {
                foreach (var contact in data.contacts)
                {
                    LinkLeadContacts linkLeadContacts = new LinkLeadContacts();
                    linkLeadContacts.ContactId = contact.LeadId;
                    linkLeadContacts.LeadId = leadId;

                    _context.LinkLeadContacts.Add(linkLeadContacts);
                    
                }
            }

            await _context.SaveChangesAsync();

            return Ok(new { message = "Link lead Values stored successfully" });
        }

        public class AddNewSaveLeadRequest
        {
            public List<DynamicControlValues>? leaddata { get; set; }
            public List<LeadContactList>? contacts { get; set; }
        }

        [HttpGet("getControlsWithValues")]
        [Authorize]
        public async Task<List<dynamic>> getControlsWithValues(int CompanyId,string ScreenName)
        {
            EconnectContext _context = new EconnectContext();
            // var CompanyId = 1;

            var results = new List<dynamic>();

            using (var command = _context.Database.GetDbConnection().CreateCommand())
            {
                command.CommandText = "GetDynamicControlPivoted";
                command.CommandType = System.Data.CommandType.StoredProcedure;

                var parameter = command.CreateParameter();
                parameter.ParameterName = "@CompanyId";
                parameter.Value = CompanyId;
                command.Parameters.Add(parameter);

                // Second parameter
                var secondParameter = command.CreateParameter();
                secondParameter.ParameterName = "@ScreenName";
                secondParameter.Value = ScreenName;
                command.Parameters.Add(secondParameter);

                _context.Database.OpenConnection();

                using (var reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        var row = new ExpandoObject() as IDictionary<string, Object>;

                        for (var fieldIndex = 0; fieldIndex < reader.FieldCount; fieldIndex++)
                        {
                            row.Add(reader.GetName(fieldIndex), reader[fieldIndex]);
                        }

                        results.Add(row);
                    }
                }
            }

            return results;
        }
        
        [HttpGet("GetDynamicControlByLeadId")]
        [Authorize]
        public async Task<List<dynamic>> GetDynamicControlByLeadId(int CompanyId,string ScreenName,int LeadId)
        {
            EconnectContext _context = new EconnectContext();
            // var CompanyId = 1;

            var results = new List<dynamic>();

            using (var command = _context.Database.GetDbConnection().CreateCommand())
            {
                command.CommandText = "GetDynamicControlByLeadId";
                command.CommandType = System.Data.CommandType.StoredProcedure;

                var parameter = command.CreateParameter();
                parameter.ParameterName = "@CompanyId";
                parameter.Value = CompanyId;
                command.Parameters.Add(parameter);

                // Second parameter
                var secondParameter = command.CreateParameter();
                secondParameter.ParameterName = "@ScreenName";
                secondParameter.Value = ScreenName;
                command.Parameters.Add(secondParameter);
                
                // Third parameter
                var thirdParameter = command.CreateParameter();
                thirdParameter.ParameterName = "@LeadId";
                thirdParameter.Value = LeadId;
                command.Parameters.Add(thirdParameter);

                _context.Database.OpenConnection();

                using (var reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        var row = new ExpandoObject() as IDictionary<string, Object>;

                        for (var fieldIndex = 0; fieldIndex < reader.FieldCount; fieldIndex++)
                        {
                            row.Add(reader.GetName(fieldIndex), reader[fieldIndex]);
                        }

                        results.Add(row);
                    }
                }
            }

            return results;
        }
         [HttpGet("GetDynamicControlPivotedLastInserted")]
        [Authorize]
        public async Task<List<dynamic>> GetDynamicControlPivotedLastInserted(int CompanyId,string ScreenName,int LeadId)
        {
            EconnectContext _context = new EconnectContext();
            // var CompanyId = 1;

            var results = new List<dynamic>();

            using (var command = _context.Database.GetDbConnection().CreateCommand())
            {
                command.CommandText = "GetDynamicControlPivotedLastInserted";
                command.CommandType = System.Data.CommandType.StoredProcedure;

                var parameter = command.CreateParameter();
                parameter.ParameterName = "@CompanyId";
                parameter.Value = CompanyId;
                command.Parameters.Add(parameter);

                // Second parameter
                var secondParameter = command.CreateParameter();
                secondParameter.ParameterName = "@ScreenName";
                secondParameter.Value = ScreenName;
                command.Parameters.Add(secondParameter);
                
                // Third parameter
                var thirdParameter = command.CreateParameter();
                thirdParameter.ParameterName = "@LeadId";
                thirdParameter.Value = LeadId;
                command.Parameters.Add(thirdParameter);

                _context.Database.OpenConnection();

                using (var reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        var row = new ExpandoObject() as IDictionary<string, Object>;

                        for (var fieldIndex = 0; fieldIndex < reader.FieldCount; fieldIndex++)
                        {
                            row.Add(reader.GetName(fieldIndex), reader[fieldIndex]);
                        }

                        results.Add(row);
                    }
                }
            }

            return results;
        }

        [HttpPut("updateDynamicValues")]
        [Authorize]
        public async Task<ActionResult> UpdateControlValues(UpdateLeadRequest data)
        {
            using var _context = new EconnectContext();
            using var _context2 = new EconnectContext();
            // Validate if leadId is valid
            var existingLeadValues = await _context.DynamicControlValues
                .Where(x => x.LeadId == data.LeadId)
                .ToListAsync();

            if (existingLeadValues == null || existingLeadValues.Count == 0)
            {
                return NotFound($"Lead with ID {data.LeadId} not found.");
            }

            // Update Dynamic Control Values
            foreach (var value in data.leaddata)
            {
                var existingValue = existingLeadValues.FirstOrDefault(x => x.ControlId == value.ControlId);
                if (existingValue != null)
                {
                    existingValue.Value = value.Value;
                }
                await _context.SaveChangesAsync();
            }
             

            // Update Contacts
            if (data.contacts != null && data.contacts.Count > 0)
            {
                var existingContacts = await _context2.LinkLeadContacts
                    .Where(x => x.LeadId == data.LeadId)
                    .ToListAsync();

                //foreach (var contact in data.contacts)
                //{
                //    var existingContact = existingContacts
                //        .FirstOrDefault(x => x.LeadContactListID == contact.LeadContactListId);

                //    if (existingContact != null)
                //    {
                //        existingContact.Relationship = contact.Relationship;
                //    }
                //    else
                //    {
                //        LinkLeadContacts newContact = new LinkLeadContacts
                //        {
                //            LeadId = data.LeadId,
                //            LeadContactListID = contact.LeadContactListId,
                //            Relationship = contact.Relationship
                //        };
                //        _context2.LinkLeadContacts.Add(newContact);
                //    }
                //}
            }

          
            await _context2.SaveChangesAsync();
            return Ok(new { message = "Lead values updated successfully" });
        }

        [HttpPut("updateOnlyDynamicValues")]
        [Authorize]
        public async Task<ActionResult> updateOnlyDynamicValues(UpdateLeadRequest data)
        {
            using var _context = new EconnectContext();
            
            var existingLeadValues = await _context.DynamicControlValues
                .Where(x => x.LeadId == data.LeadId)
                .ToListAsync();

            if (existingLeadValues == null || existingLeadValues.Count == 0)
            {
                return NotFound($"Lead with ID {data.LeadId} not found.");
            }

            // Update Dynamic Control Values
            foreach (var value in data.leaddata)
            {
                var existingValue = existingLeadValues.FirstOrDefault(x => x.ControlId == value.ControlId);
                if (existingValue != null)
                {
                    existingValue.Value = value.Value;
                }
                await _context.SaveChangesAsync();
            }

            return Ok(new { message = "Lead values updated successfully" });
        }

        public class UpdateLeadRequest
        {
            public int LeadId { get; set; }
            public List<DynamicControlValues> leaddata { get; set; }
            public List<LeadContactList>? contacts { get; set; }
        }



        [HttpPost("saveOnlyDynamicValues")]
        [Authorize]
        public async Task<ActionResult> saveOnlyDynamicValues(AddNewSaveLeadRequest data)
        {
            using var _context = new EconnectContext();

            if (data.leaddata == null || data.leaddata.Count == 0)
            {
                return BadRequest("Control values are empty");
            }

            // Save Dynamic Control Values
            int? maxLeadId = await _context.DynamicControlValues.MaxAsync(x => (int?)x.LeadId);
            int leadId = (maxLeadId ?? 0) + 1;
            foreach (var value in data.leaddata)
            {
                value.LeadId = leadId;
                _context.DynamicControlValues.Add(value);
            }
            await _context.SaveChangesAsync();

            return Ok(new { message =  leadId });
        }

    }
}
