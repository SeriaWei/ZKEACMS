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
    public class DateTimeFormDataValidator : IFormDataValidator
    {
        public bool Validate(FormField field, FormDataItem data, out string message)
        {
            message = string.Empty;
            DateTime dateTime;
            if (field.Name == "Date" && data.FieldValue.IsNotNullAndWhiteSpace() && !DateTime.TryParse(data.FieldValue, out dateTime))
            {
                message = $"{field.DisplayName}的日期格式不正确";
                return false;
            }
            return true;
        }
    }
}
