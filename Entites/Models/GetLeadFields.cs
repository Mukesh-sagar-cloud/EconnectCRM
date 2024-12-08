using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Entites.Models;

public partial class GetLeadFields
{
   
    public int CompanyId { get; set; }
  
    [Key]
    public int LeadFieldId { get; set; }
    public string? FieldId { get; set; }
    public string? FieldLabel { get; set; }
    public string? FieldType { get; set; }
    public string? FieldCustom { get; set; }
    public int FieldMaxLength { get; set; }
    public int FieldColumns { get; set; }
    public int FieldRows { get; set; }
    public string? FieldReporting { get; set; }
    public string? FieldHidden { get; set; }
    public string? FieldReadOnly { get; set; }
    public string? FieldPlaceholder { get; set; }
    public string? FieldAttributes { get; set; }
    public string? FieldRequired { get; set; }
    public string? FieldValueUnique { get; set; }
    public int FieldSequence { get; set; }
    public string? has_data { get; set; }


}
