using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entites.Models
{
    public class DynamicControls
    {
        public int Id { get; set; }  
        public int? CompanyId { get; set; }
        public string? ControlType { get; set; }
        public string? Label { get; set; }
        public string? Options { get; set; }
        public string? ScreenName { get; set; }
        public bool? IsDisplayInGrid { get; set; }
        public int? FieldSequence { get; set; }
    }
}
