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
    public class DateTimeFormDataValidator : IFormDataValidator
    {
        private readonly ILocalize _localize;
        public DateTimeFormDataValidator(ILocalize localize)
        {
            _localize = localize;
        }
        public bool Validate(FormField field, FormDataItem data, out string message)
        {
            message = string.Empty;
            DateTime dateTime;
            if (field.Name == "Date" && data.FieldValue.IsNotNullAndWhiteSpace() && !DateTime.TryParse(data.FieldValue, out dateTime))
            {
                message = _localize.Get("{0}的日期格式不正确").FormatWith(field.DisplayName);
                return false;
            }
            return true;
        }
    }
}
