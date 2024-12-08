namespace LeadMicroservices.Models
{
    public class DynamicControlWithValue
    {
        public int Id { get; set; }
        public string? ControlType { get; set; }
        public string? Label { get; set; }
        public string? Options { get; set; } // This could be a JSON string if needed
        public string? Value { get; set; } // This is the value from DynamicControlValues
    }

}
