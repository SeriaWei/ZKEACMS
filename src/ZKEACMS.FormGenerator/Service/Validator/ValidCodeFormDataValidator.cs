/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.FormGenerator.Models;
using ZKEACMS.Validate;
using Easy.Extend;

namespace ZKEACMS.FormGenerator.Service.Validator
{
    public class ValidCodeFormDataValidator : IFormDataValidator
    {
        private readonly ILocalize _localize;
        private readonly IValidateService _validate;
        public ValidCodeFormDataValidator(ILocalize localize, IValidateService validateService)
        {
            _localize = localize;
            _validate = validateService;
        }

        public bool Validate(FormField field, FormDataItem data, out string message)
        {
            message = string.Empty;
            if (field.Name == "ValidCode" && data.FieldValue.IsNotNullAndWhiteSpace())
            {
                string code = _validate.GetCode();
                if (!code.Equals(data.FieldValue, StringComparison.InvariantCultureIgnoreCase))
                {
                    message = _localize.Get("{0} is not correct.").FormatWith(field.DisplayName);
                    return false;
                }
            }
            return true;
        }
    }
}
