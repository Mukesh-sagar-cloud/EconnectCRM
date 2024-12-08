namespace LeadMicroservices.Models
{
	public class GenericModel<T>
	{
		private string fieldValue;

		public int LeadFieldId { get; set; }
		public string FieldLabel { get; set; }
		public string FieldType { get; set; }
		public string FieldCustom { get; set; }
		public T? FieldValue { get; set; }

		public GenericModel(int leadFieldId, string fieldLabel, string fieldType, T? fieldValue, string fieldCustom)
		{
			LeadFieldId = leadFieldId;
			FieldLabel = fieldLabel;
			FieldType = fieldType;
			FieldValue = fieldValue;
			FieldCustom = fieldCustom;
		}

		public GenericModel(int leadFieldId, string fieldLabel, string fieldType, string fieldValue)
		{
			LeadFieldId = leadFieldId;
			FieldLabel = fieldLabel;
			FieldType = fieldType;
			this.fieldValue = fieldValue;
		}
	}
}
