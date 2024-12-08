using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Entites.Models;

public partial class Event
{
    [Key]
    public int EventId { get; set; }
    public int EventTypeId { get; set; }
    public int CampusId { get; set; }
    public string? Location { get; set; }
    public int MaxNumber { get; set; }
    public string? Description { get; set; }
    public DateTime? EventDate { get; set; }
    public DateTime? StartTime { get; set; }
    public DateTime? EndTime { get; set; }

}
