using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.FormGenerator.Models;
using Easy.Extend;

namespace ZKEACMS.FormGenerator.Service.Validator
{
    public class NumberFormDataValidator : IFormDataValidator
    {
        public bool Validate(FormField field, FormDataItem data, out string message)
        {
            message = string.Empty;
            decimal result;
            if (field.Name == "Number" && data.FieldValue.IsNotNullAndWhiteSpace() && !Decimal.TryParse(data.FieldValue, out result))
            {
                message = $"{field.DisplayName}只能填入数字";
                return false;
            }
            return true;
        }
    }
}
