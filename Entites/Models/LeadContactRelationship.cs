using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Entites.Models;

public partial class LeadContactRelationship
{
    [Key]
    public int SNo { get; set; }
    public int LeadContactListID { get; set; }
    public int ContactRelationshipId { get; set; }
    public string? Relationship { get; set; }
    public string? ContactType { get; set; }
}
