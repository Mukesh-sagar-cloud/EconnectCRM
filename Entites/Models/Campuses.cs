using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Entites.Models;

public partial class Campuses
{
    [Key]
    public int CampusId { get; set; }

    public string? CampusName { get; set; }

}
