/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.FormGenerator.Models;
using ZKEACMS.Captcha;
using Easy.Extend;

namespace ZKEACMS.FormGenerator.Service.Validator
{
    public class ValidCodeFormDataValidator : IFormDataValidator
    {
        private readonly ILocalize _localize;
        private readonly IImageCaptchaService _imageCaptchaService;
        public ValidCodeFormDataValidator(ILocalize localize, IImageCaptchaService imageCaptchaService)
        {
            _localize = localize;
            _imageCaptchaService = imageCaptchaService;
        }

        public bool Validate(FormField field, FormDataItem data, out string message)
        {
            message = string.Empty;
            if (field.Name == "ValidCode" && data.FieldValue.IsNotNullAndWhiteSpace())
            {
                if (!_imageCaptchaService.ValidateCode(data.FieldValue))
                {
                    message = _localize.Get("{0} is not correct.").FormatWith(field.DisplayName);
                    return false;
                }
            }
            return true;
        }
    }
}
