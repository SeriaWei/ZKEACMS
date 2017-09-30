using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ZKEACMS.FormGenerator.Models
{
    public class FieldOption
    {
        public string DisplayText { get; set; }
        private string _value;
        public string Value
        {
            get
            {
                if (_value == null)
                {
                    _value = Guid.NewGuid().ToString("N");
                }
                return _value;
            }
            set { _value = value; }
        }
        public bool? Selected { get; set; }
    }
}
