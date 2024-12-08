using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entites.Models
{
    public class DynamicControlValues
    {
        public int Id { get; set; }
        public int ControlId { get; set; }
        public string? Value { get; set; }
        public int LeadId { get; set; }
    }
}
