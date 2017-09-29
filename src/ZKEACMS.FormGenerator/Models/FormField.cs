using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Easy.Extend;

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
        public string Description { get; set; }
        public string Placeholder { get; set; }
        public bool IsRequired { get; set; }
        public int? Size { get; set; }
        public IEnumerable<FieldOption> FieldOptions { get; set; }
    }
}
