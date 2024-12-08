using System;
using System.Collections.Generic;

namespace Entites.Models;

public partial class LeadContactList
{
    public int LeadContactListId { get; set; }
    
    public int LeadId { get; set; }

    public int? CompanyId { get; set; }

    public string? Salutation { get; set; }
    public string? Relationship { get; set; }

    public string? FirstName { get; set; }

    public string? LastName { get; set; }

    public string? Gender { get; set; }

    public string? Address { get; set; }

    public string? City { get; set; }

    public string? State { get; set; }

    public int? PostCode { get; set; }

    public string? Email { get; set; }

    public string? MobilePhone { get; set; }

    public string? HomePhone { get; set; }

    public string? WorkPhone { get; set; }

    public bool? ReceiveMail { get; set; }

    public bool? ReceiveEmail { get; set; }

    public bool? ReceiveSMS { get; set; }

    public string? Alumni { get; set; }

    public string? GraduationYear { get; set; }

    public string? NameAtSchool { get; set; }
}
