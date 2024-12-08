using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Entites.Models;

public partial class LinkLeadContacts
{
    [Key]
    public int LinkLeadContactId { get; set; }
    public int LeadId { get; set; }
    public int ContactId { get; set; }
}
