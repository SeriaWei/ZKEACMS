using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.FormGenerator.Models;
using Easy.Extend;
using Easy;

namespace ZKEACMS.FormGenerator.Service.Validator
{
    public class RequiredFormDataValidator : IFormDataValidator
    {
        private readonly ILocalize _localize;
        public RequiredFormDataValidator(ILocalize localize)
        {
            _localize = localize;
        }
        public bool Validate(FormField field, FormDataItem data, out string message)
        {
            message = string.Empty;
            if (field.IsRequired && data.FieldValue.IsNullOrWhiteSpace() && data.OptionValue.IsNullOrWhiteSpace())
            {
                message = _localize.Get("{0}是必填的").FormatWith(field.DisplayName);
                return false;
            }
            return true;
        }
    }
}
