/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.ViewPort.Validator;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Setting;

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
            bool useImageCaptcha = Easy.ServiceLocator.GetService<IApplicationSettingService>().Get(SettingKeys.UseImageCaptcha, "true") == "true";
            if (!useImageCaptcha) return true;

            return Easy.ServiceLocator.GetService<IImageCaptchaService>().ValidateCode(value?.ToString());
        }
    }
}
