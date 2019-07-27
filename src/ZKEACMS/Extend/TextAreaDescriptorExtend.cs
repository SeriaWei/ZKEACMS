using Easy.ViewPort.Descriptor;
using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Extend
{
    public static class TextAreaDescriptorExtend
    {
        public static TextAreaDescriptor AsCodeEditor(this TextAreaDescriptor textArea)
        {
            return textArea.SetTemplate("TemplateContent");
        }
    }
}
