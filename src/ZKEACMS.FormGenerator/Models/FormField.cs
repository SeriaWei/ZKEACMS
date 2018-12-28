using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Easy.Extend;
using Newtonsoft.Json;
using System.Text;

namespace ZKEACMS.FormGenerator.Models
{
    public class FormField
    {
        private string id;
        public string ID
        {
            get
            {
                if (id.IsNullOrEmpty())
                {
                    id = $"FF{Guid.NewGuid().ToString("N")}";
                }
                return id;
            }
            set
            {
                id = value;
            }
        }
        public string Name { get; set; }
        public string DisplayName { get; set; }
        public string Value { get; set; }
        public string Description { get; set; }
        public string Placeholder { get; set; }
        public bool IsRequired { get; set; }
        public int? Size { get; set; }
        public string Column { get; set; }
        public string RegexPattern { get; set; }
        public string RegexMessage { get; set; }
        Dictionary<string, object> attirbutes;
        [JsonIgnore]
        public Dictionary<string, object> Attributes
        {
            get
            {
                if (attirbutes == null)
                {
                    attirbutes = new Dictionary<string, object>();
                    attirbutes.Add("class", (IsRequired ? "required " : "") + "form-control ");
                    attirbutes.Add("data-val", "true");
                    if (IsRequired)
                    {
                        attirbutes.Add("data-val-required", DisplayName + "不能为空");
                    }
                    if (Placeholder.IsNotNullAndWhiteSpace())
                    {
                        attirbutes.Add("placeholder", Placeholder);
                    }
                    if (RegexPattern.IsNotNullAndWhiteSpace())
                    {
                        Attributes.Add("data-val-regex", RegexMessage ?? "输入不正确");
                        Attributes.Add("data-val-regex-pattern", RegexPattern);
                    }
                }
                return attirbutes;
            }
        }
        public List<FieldOption> FieldOptions { get; set; }
        public List<AdditionalSetting> AdditionalSettings { get; set; }
        public string DisplayValue()
        {
            StringBuilder valueContent = new StringBuilder();
            if ((Name == "Checkbox" || Name == "Radio" || Name == "Dropdown") && FieldOptions != null)
            {
                valueContent.Append(string.Join("\r\n", FieldOptions.Where(m => m.Selected ?? false).Select(m => m.DisplayText)));
            }
            else if (Name == "Address" && Value.IsNotNullAndWhiteSpace())
            {
                valueContent.Append(string.Join(" ", JsonConvert.DeserializeObject<string[]>(Value)));
            }
            else
            {
                valueContent.Append(Value);
            }
            return valueContent.ToString();
        }
    }
}
