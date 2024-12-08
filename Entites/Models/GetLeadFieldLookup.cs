using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Entites.Models;

public partial class GetLeadFieldLookup
{
    [Key]
    public int table_field_lookup_id { get; set; }
    public int table_field_id { get; set; }

    public string? value { get; set; }
    public int Sequence { get; set; }

}
