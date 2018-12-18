using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.FormGenerator.Models;
using Easy.Extend;
using System.Text.RegularExpressions;
using Easy.Constant;
using Easy;

namespace ZKEACMS.FormGenerator.Service.Validator
{
    public class EmailFormDataValidator : IFormDataValidator
    {
        private readonly ILocalize _localize;
        public EmailFormDataValidator(ILocalize localize)
        {
            _localize = localize;
        }
        public bool Validate(FormField field, FormDataItem data, out string message)
        {
            message = string.Empty;
            if (field.Name == "Email" && data.FieldValue.IsNotNullAndWhiteSpace() && !Regex.IsMatch(data.FieldValue, RegularExpression.Email))
            {
                message = _localize.Get("{0}的邮件格式不正确").FormatWith(field.DisplayName);
                return false;
            }
            return true;
        }
    }
}
