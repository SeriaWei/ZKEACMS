using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.FormGenerator.Models;
using Easy.Extend;

namespace ZKEACMS.FormGenerator.Service.Validator
{
    public class RequiredFormDataValidator : IFormDataValidator
    {
        public bool Validate(FormField field, FormDataItem data, out string message)
        {
            message = string.Empty;
            if (field.IsRequired && data.FieldValue.IsNullOrWhiteSpace() && data.OptionValue.IsNullOrWhiteSpace())
            {
                message = $"{field.DisplayName}是必填的";
                return false;
            }
            return true;
        }
    }
}
