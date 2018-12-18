using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.FormGenerator.Models;
using Easy.Extend;
using System.Text.RegularExpressions;
using Easy.Constant;

namespace ZKEACMS.FormGenerator.Service.Validator
{
    public class RegexPatternValidator : IFormDataValidator
    {
        public bool Validate(FormField field, FormDataItem data, out string message)
        {
            message = string.Empty;
            if (field.RegexPattern.IsNotNullAndWhiteSpace() && data.FieldValue.IsNotNullAndWhiteSpace() && !Regex.IsMatch(data.FieldValue, field.RegexPattern))
            {
                message = field.RegexMessage;
                return false;
            }
            return true;
        }
    }
}
