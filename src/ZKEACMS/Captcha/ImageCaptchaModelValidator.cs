/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy.ViewPort.Validator;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.Captcha
{
    public class ImageCaptchaModelValidator : ValidatorBase
    {
        public ImageCaptchaModelValidator(string property)
        {
            Property = property;
            BaseErrorMessage = "{0} is not correct.";
        }
        public override bool Validate(object value)
        {
            return Easy.ServiceLocator.GetService<IImageCaptchaService>().ValidateCode(value?.ToString());
        }
    }
}
