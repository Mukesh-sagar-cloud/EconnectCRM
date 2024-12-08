using Entites.Models;
using LeadMicroservices.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.Design;
using System.Dynamic;

namespace LeadMicroservices.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LeadController : ControllerBase
    {
        //[HttpGet("GetLeads")]
        //[Authorize]
        //public ActionResult<IEnumerable<Lead>> GetLeads()
        //{
        //    EconnectContext _context = new EconnectContext();
        //    List<Lead> lead = _context.Leads.ToList();
        //    return Ok(lead);
        //}

        //[HttpGet("GetLeadFields")]
        //[Authorize]
        //public async Task<ActionResult<IEnumerable<GetLeadFields>>> GetLeadFields(int CompanyId)
        //{
        //    EconnectContext _context = new EconnectContext();

        //    var lead = await _context.GetLeadFields
        //                            .FromSqlRaw("EXEC GetLeadField @CompanyId = {0}", CompanyId)
        //                            .ToListAsync();
        //    return Ok(lead);
        //}

        //[HttpGet("GetLeadFieldLookup")]
        //[Authorize]
        //public async Task<ActionResult<IEnumerable<LeadFieldLookup>>> GetLeadFieldLookup(int CompanyId)
        //{
        //    EconnectContext _context = new EconnectContext();

        //    var lead = await _context.GetLeadFieldLookup
        //                            .FromSqlRaw("EXEC GetLeadFieldLookup @CompanyId = {0}", CompanyId)
        //                            .ToListAsync();
        //    return Ok(lead);
        //}

        //[HttpGet("GetLeadFullData")]
        //[Authorize]
        //public async Task<List<dynamic>> GetLeadFullData(int CompanyId)
        //{
        //    EconnectContext _context = new EconnectContext();
        //    // var CompanyId = 1;

        //    var results = new List<dynamic>();

        //    using (var command = _context.Database.GetDbConnection().CreateCommand())
        //    {
        //        command.CommandText = "GetLeadsWithDynamicFields";
        //        command.CommandType = System.Data.CommandType.StoredProcedure;

        //        var parameter = command.CreateParameter();
        //        parameter.ParameterName = "@CompanyId";
        //        parameter.Value = CompanyId;
        //        command.Parameters.Add(parameter);

        //        _context.Database.OpenConnection();

        //        using (var reader = await command.ExecuteReaderAsync())
        //        {
        //            while (await reader.ReadAsync())
        //            {
        //                var row = new ExpandoObject() as IDictionary<string, Object>;

        //                for (var fieldIndex = 0; fieldIndex < reader.FieldCount; fieldIndex++)
        //                {
        //                    row.Add(reader.GetName(fieldIndex), reader[fieldIndex]);
        //                }

        //                results.Add(row);
        //            }
        //        }
        //    }

        //    return results;
        //}

        //[HttpGet("GetLeadFieldsLabelValuesByCompany")]
        //[Authorize]
        //public List<GenericModel<object>> GetLeadFieldsLabelValuesByCompany(int companyId)
        //{
        //    using (EconnectContext _context = new EconnectContext())
        //    {
        //        var leadFieldTypesQuery =
        //            from leadFieldType in _context.LeadFieldTypess
        //            where leadFieldType.CompanyId == companyId
        //            select new
        //            {
        //                LeadFieldId = leadFieldType.LeadFieldId,
        //                FieldLabel = leadFieldType.FieldLabel,
        //                FieldType = leadFieldType.FieldType,
        //                FieldValue = "", // Hardcoded empty string
        //                FieldCustom = leadFieldType.FieldCustom
        //            };

        //        var leadFieldsQuery =
        //            from lf in _context.LeadFields
        //            join lv in _context.LeadFieldValues on lf.LeadFieldId equals lv.LeadFieldId into lvGroup
        //            from lv in lvGroup.DefaultIfEmpty() // Left join
        //            where lf.CompanyId == companyId
        //            select new
        //            {
        //                LeadFieldId = lf.LeadFieldId,
        //                FieldLabel = lf.FieldLabel,
        //                FieldType = lf.FieldType,
        //                FieldValue = lv.FieldValue ?? "", // Handle potential null values
        //                FieldCustom = lf.FieldCustom
        //            };

        //        // Combine both queries and order by LeadFieldId
        //        var query = leadFieldTypesQuery.Concat(leadFieldsQuery)
        //                                       .OrderBy(x => x.LeadFieldId)
        //                                       .ToList();

        //        // Transform the result into a list of GenericModel<object>
        //        var result = query
        //            .Select(x => new GenericModel<object>(
        //                x.LeadFieldId,
        //                x.FieldLabel,
        //                x.FieldType,
        //                x.FieldValue
        //            ))
        //            .ToList();

        //        return result;
        //    }
        //}

        //[HttpPost("SaveLeadFieldsLabelValues")]
        //[Authorize]
        //public IActionResult SaveLeadFieldsLabelValues([FromBody] List<GenericModel<object>> leadFieldsModels, [FromQuery] int companyId)
        //{
        //    EconnectContext _context = new EconnectContext();
        //    var leadFieldTypeQuery = _context.LeadFieldTypess
        //        .Where(lft => lft.CompanyId == null)
        //        .Select(lft => new { lft.FieldId, lft.FieldCustom })
        //        .Distinct();


        //    var leadFieldQuery = _context.LeadFields
        //            .Where(lf => lf.CompanyId == 1)
        //            .Select(lf => new { lf.FieldId, lf.FieldCustom })
        //            .Distinct();

        //    var combinedQuery = leadFieldTypeQuery
        //            .Union(leadFieldQuery)
        //            .ToList();

        //    var dictionaryList = combinedQuery
        //            .Select(item => new Dictionary<string, object>
        //            {
        //                { "FieldId", item.FieldId },
        //                { "FieldCustom", item.FieldCustom }
        //            })
        //            .ToList();

        //    // Process each leadFieldsModel
        //    foreach (var model in leadFieldsModels)
        //    {
        //        var lead = model.FieldValue as IDictionary<string, object>;

        //        // Example: Access specific properties
        //        if (lead != null)
        //        {
        //            string firstName = lead.ContainsKey("FirstName") ? lead["FirstName"].ToString() : string.Empty;
        //            // Process further
        //        }
        //    }

        //    return Ok(); // or any appropriate response
        //}

        //public IActionResult SaveLeadFieldsLabelValues(List<GenericModel<object>> leadFieldsModels, int companyId)
        //{
        //    int leadId = -1;
        //    using (EconnectContext _context = new EconnectContext())
        //    {
        //        try
        //        {
        //            // Get the LeadFieldType to determine if it's custom or not
        //            var leadFieldType = _context.LeadFieldTypess
        //                                        .FirstOrDefault(lf => lf.FieldCustom == "N" && lf.CompanyId == companyId);

        //            if (leadFieldType == null)
        //            {
        //                return NotFound("Lead field type not found.");
        //            }

        //            if (leadFieldType.FieldCustom == "N")
        //            {
        //                var fieldNames = _context.LeadFieldTypess
        //                                        .Where(lf => lf.FieldCustom == "N" && lf.CompanyId == companyId)
        //                                        .Select(lf => lf.FieldLabel)
        //                                        .Union(_context.LeadFields
        //                                            .Where(lf => lf.FieldCustom == "N" && lf.CompanyId == companyId)
        //                                            .Select(lf => lf.FieldLabel))
        //                                        .Distinct()
        //                                        .ToList();

        //                Lead lead = CreateLeadFromFieldNames(companyId, fieldNames, leadFieldsModels);
        //                _context.Leads.Add(lead);
        //                leadId = lead.LeadId;
        //            }
        //            else
        //            {
        //                var leadFieldIds = _context.LeadFieldTypess
        //                                            .Where(lf => lf.FieldCustom == "Y" && lf.CompanyId == companyId)
        //                                            .Select(lf => lf.LeadFieldId)
        //                                            .Union(
        //                                                _context.LeadFields
        //                                                    .Where(lf => lf.FieldCustom == "Y" && lf.CompanyId == companyId)
        //                                                    .Select(lf => lf.LeadFieldId)
        //                                            )
        //                                            .Distinct()
        //                                            .ToList();

        //                List<LeadFieldValue> leadFieldValue = CreateLeadFieldValuesById(companyId, leadFieldIds, leadFieldsModels);

        //                if (leadFieldValue.Count > 0)
        //                {
        //                    for (int i = 0; i < leadFieldValue.Count; i++)
        //                    {
        //                        _context.LeadFieldValues.Add(leadFieldValue[i]);
        //                    }
        //                }
        //            }

        //            // Save changes to the database
        //            _context.SaveChanges();

        //            return Ok("Data saved successfully.");
        //        }
        //        catch (Exception ex)
        //        {
        //            // Log exception and return error response
        //            return StatusCode(500, $"Internal server error: {ex.Message}");
        //        }
        //    }
        //}

        //public static Lead CreateLeadFromFieldNames(int companyId, List<string> fieldValues, List<GenericModel<object>> leadFieldsModels)
        //{
        //    var lead = new Lead
        //    {
        //        CompanyId = companyId
        //    };

        //    for (int i = 0; i < leadFieldsModels.Count; i++)
        //    {
        //        var model = leadFieldsModels[i];

        //        if (i < fieldValues.Count)
        //        {
        //            string fieldLabel = model.FieldLabel;

        //            var property = typeof(Lead).GetProperty(fieldLabel);
        //            if (property != null)
        //            {
        //                // Convert and set the property value based on its type
        //                object convertedValue = ConvertValue(fieldValues[i], property.PropertyType);
        //                if (convertedValue != null)
        //                {
        //                    property.SetValue(lead, convertedValue);
        //                }
        //            }
        //        }
        //    }
        //    return lead;
        //}

        //private static object? ConvertValue(string value, Type targetType)
        //{
        //    if (targetType == typeof(string))
        //    {
        //        return value;
        //    }
        //    if (targetType == typeof(int))
        //    {
        //        return int.TryParse(value, out var intValue) ? intValue : null;
        //    }
        //    if (targetType == typeof(DateTime))
        //    {
        //        return DateTime.TryParse(value, out var dateTimeValue) ? dateTimeValue : null;
        //    }
        //    if (targetType == typeof(bool))
        //    {
        //        return bool.TryParse(value, out var boolValue) ? boolValue : null;
        //    }
        //    return null;
        //}

        //public static List<LeadFieldValue> CreateLeadFieldValuesById(int companyId, List<int> leadFieldIds, List<GenericModel<object>> leadFieldsModels)
        //{
        //    List<LeadFieldValue> leadFieldValue = new List<LeadFieldValue>();

        //    foreach (var model in leadFieldsModels)
        //    {
        //        if (leadFieldIds.Contains(model.LeadFieldId))
        //        {
        //            // Create a new LeadFieldValue instance
        //            var tempValue = new LeadFieldValue
        //            {
        //                LeadId = companyId,
        //                LeadFieldId = model.LeadFieldId,
        //                FieldValue = model.FieldValue?.ToString(),
        //                CreatedBy = 99999,
        //                CreatedDate = DateTime.Now,
        //                ModifiedBy = 99999,
        //                ModifiedDate = DateTime.Now
        //            };
        //            leadFieldValue.Add(tempValue);
        //        }
        //    }
        //    return leadFieldValue;
        //}
    }
}
