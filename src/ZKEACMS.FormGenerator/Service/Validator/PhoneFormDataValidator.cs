/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using ZKEACMS.FormGenerator.Models;
using Easy.Extend;
using Easy.Constant;

namespace ZKEACMS.FormGenerator.Service.Validator
{
    public class PhoneFormDataValidator : IFormDataValidator
    {
        private readonly ILocalize _localize;
        public PhoneFormDataValidator(ILocalize localize)
        {
            _localize = localize;
        }

        public bool Validate(FormField field, FormDataItem data, out string message)
        {
            message = string.Empty;
            if (field.Name == "Phone" && data.FieldValue.IsNotNullAndWhiteSpace())
            {
                if (Regex.IsMatch(data.FieldValue, RegularExpression.ChinesePhone) || Regex.IsMatch(data.FieldValue, RegularExpression.ChineseMobile))
                {
                    return true;
                }
                else
                {
                    message = _localize.Get("Invalid value for {0}.").FormatWith(field.DisplayName);
                    return false;
                }
            }
            return true;
        }
    }
}
