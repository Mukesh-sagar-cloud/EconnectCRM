using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Entites.Models;

public partial class EventTypes
{
    [Key]
    public int EventTypeId { get; set; }

    public string? EventTypeName { get; set; }

}
