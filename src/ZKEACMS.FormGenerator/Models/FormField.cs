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
        [JsonIgnore]
        public Dictionary<string, object> Attributes
        {
            get
            {
                Dictionary<string, object> dictionary = new Dictionary<string, object>();
                dictionary.Add("class", (IsRequired ? "required " : "") + "form-control ");
                if (IsRequired)
                {
                    dictionary.Add("data-val", "true");
                    dictionary.Add("data-val-required", DisplayName + " 不能为空");
                }
                if (Placeholder.IsNotNullAndWhiteSpace())
                {
                    dictionary.Add("placeholder", Placeholder);
                }
                return dictionary;
            }
        }
        public List<FieldOption> FieldOptions { get; set; }
    }
}
