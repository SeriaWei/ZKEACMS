using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.FormGenerator.Models;
using Easy.Extend;
using Easy;

namespace ZKEACMS.FormGenerator.Service.Validator
{
    public class MaxLengthFormDataValidator : IFormDataValidator
    {
        private readonly ILocalize _localize;
        public MaxLengthFormDataValidator(ILocalize localize)
        {
            _localize = localize;
        }
        public bool Validate(FormField field, FormDataItem data, out string message)
        {
            message = string.Empty;
            if (field.Name == "SingleLine" && data.FieldValue.IsNotNullAndWhiteSpace() && data.FieldValue.Length > 200)
            {
                message = _localize.Get("{0}的长度应小于200").FormatWith(field.DisplayName);
                return false;
            }
            else if (field.Name == "Paragraph" && data.FieldValue.IsNotNullAndWhiteSpace() && data.FieldValue.Length > 1000)
            {
                message = _localize.Get("{0}的长度应小于1000").FormatWith(field.DisplayName);
                return false;
            }

            return true;
        }
    }
}
