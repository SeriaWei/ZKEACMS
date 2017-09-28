using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ZKEACMS.FormGenerator.Models
{
    public class FormField
    {
        public string DisplayName { get; set; }
        public string Description { get; set; }
        public string Placeholder { get; set; }
        public bool IsRequired { get; set; }
        public int Size { get; set; }
        public IEnumerable<FieldOption> FieldOptions { get; set; }
    }
}
