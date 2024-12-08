using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Entites.Models;

public class DecryptedPasswordDto
{
    [Key]
    public string DecryptedPassword { get; set; }
}

