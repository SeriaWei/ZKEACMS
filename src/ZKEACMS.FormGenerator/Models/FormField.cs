using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Easy.Extend;
using Newtonsoft.Json;

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
                    id = Guid.NewGuid().ToString("N");
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
                }
                return attirbutes;
            }
        }
        public List<FieldOption> FieldOptions { get; set; }
        public List<AdditionalSetting> AdditionalSettings { get; set; }
    }
}
