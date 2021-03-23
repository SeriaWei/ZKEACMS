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
            textBoxDescriptor.SetDisplayName("Captcha");
            textBoxDescriptor.PlaceHolder("Captcha");
            textBoxDescriptor.Required();
            textBoxDescriptor.SetTemplate("ImageCaptcha");
            textBoxDescriptor.Validator.Add(new ImageCaptchaModelValidator(textBoxDescriptor.Name));
            textBoxDescriptor.MaxLength(10);
            textBoxDescriptor.AddClass("image-captcha");
            return textBoxDescriptor;
        }
        public static TextBoxDescriptor AsArticleSelector(this TagsHelper helper)
        {
            TextBoxDescriptor descriptor = helper.AsTextBox();
            descriptor.AddClass(StringKeys.SelectArticleClass);
            descriptor.AddProperty("data-width", "100%");
            descriptor.AddProperty("data-url", Urls.SelectArticle);
            descriptor.SetTemplate("ArticleSelector");
            descriptor.ReadOnly();
            return descriptor;
        }
        public static TextBoxDescriptor AsProductSelector(this TagsHelper helper)
        {
            TextBoxDescriptor descriptor = helper.AsTextBox();
            descriptor.AddClass(StringKeys.SelectProductClass);
            descriptor.AddProperty("data-width", "100%");
            descriptor.AddProperty("data-url", Urls.SelectProduct);
            descriptor.SetTemplate("ProductSelector");
            descriptor.ReadOnly();
            return descriptor;
        }
    }
}
