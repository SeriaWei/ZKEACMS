/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy.ViewPort;
using Easy.ViewPort.Descriptor;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Captcha;

namespace ZKEACMS
{
    public static class TagsHelperExtend
    {
        public static TextBoxDescriptor AsImageCaptcha(this TagsHelper tagsHelper)
        {
            TextBoxDescriptor textBoxDescriptor = tagsHelper.AsTextBox();
            textBoxDescriptor.Required();
            textBoxDescriptor.SetTemplate("ImageCaptcha");
            textBoxDescriptor.Validator.Add(new ImageCaptchaModelValidator(textBoxDescriptor.Name));
            textBoxDescriptor.MaxLength(10);
            return textBoxDescriptor;
        }
    }
}
