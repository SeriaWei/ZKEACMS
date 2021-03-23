using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Easy.ViewPort.Validator
{
    public class CustomValidationHandler : RequiredAttribute
    {
        private readonly Func<object, bool> _isValid;
        public CustomValidationHandler(Func<object, bool> isValid)
        {
            _isValid = isValid;
        }
        public override bool IsValid(object value)
        {
            return _isValid(value);
        }
    }
}
