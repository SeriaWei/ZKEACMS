/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using Easy.Constant;
using Easy.ViewPort.Descriptor;
using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Extend
{
    public static class TextBoxDescriptorExtend
    {
        public static TextBoxDescriptor PageSelector(this TextBoxDescriptor descriptor)
        {
            return descriptor.AddClass(StringKeys.SelectPageClass).AddProperty("data-url", Urls.SelectPage);
        }
        public static TextBoxDescriptor MediaSelector(this TextBoxDescriptor descriptor)
        {
            return descriptor.AddClass(StringKeys.SelectImageClass).AddProperty("data-url", Urls.SelectMedia);
        }
        public static TextBoxDescriptor FileSelector(this TextBoxDescriptor descriptor)
        {
            return descriptor.AddClass(StringKeys.SelectMediaClass).AddProperty("data-url", Urls.SelectMedia);
        }
        public static TextBoxDescriptor UrlPart(this TextBoxDescriptor descriptor)
        {
            return descriptor.AddClass(StringKeys.UrlPart).SetTemplate("UrlPart").RegularExpression(RegularExpression.LetterNumberOrLine);
        }
    }
}
