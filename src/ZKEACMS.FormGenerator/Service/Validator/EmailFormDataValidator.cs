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
    public class EmailFormDataValidator : IFormDataValidator
    {
        public bool Validate(FormField field, FormDataItem data, out string message)
        {
            message = string.Empty;
            if (field.Name == "Email" && data.FieldValue.IsNotNullAndWhiteSpace() && !Regex.IsMatch(data.FieldValue, RegularExpression.Email))
            {
                message = $"{field.DisplayName}的邮件格式不正确";
                return false;
            }
            return true;
        }
    }
}
