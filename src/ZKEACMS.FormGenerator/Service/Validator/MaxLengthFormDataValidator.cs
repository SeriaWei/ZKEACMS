using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.FormGenerator.Models;
using Easy.Extend;

namespace ZKEACMS.FormGenerator.Service.Validator
{
    public class MaxLengthFormDataValidator : IFormDataValidator
    {
        public bool Validate(FormField field, FormDataItem data, out string message)
        {
            message = string.Empty;
            if (field.Name == "SingleLine" && data.FieldValue.IsNotNullAndWhiteSpace() && data.FieldValue.Length > 200)
            {
                message = $"{field.DisplayName}的长度应小于200";
                return false;
            }
            else if (field.Name == "Paragraph" && data.FieldValue.IsNotNullAndWhiteSpace() && data.FieldValue.Length > 1000)
            {
                message = $"{field.DisplayName}的长度应小于1000";
                return false;
            }

            return true;
        }
    }
}
