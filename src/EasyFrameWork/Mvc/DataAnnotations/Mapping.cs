using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.Mvc.DataAnnotations
{
    class Mapping
    {
        public Mapping(string validatorName, string property)
        {
            ValidatorName = validatorName;
            Property = property;
        }
        public string ValidatorName { get; set; }
        public string Property { get; set; }
    }
}
