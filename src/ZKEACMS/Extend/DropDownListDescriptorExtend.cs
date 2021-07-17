/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.ViewPort.Descriptor;
using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Extend
{
    public static class DropDownListDescriptorExtend
    {
        public static DropDownListDescriptor AsWidgetTemplateChooser(this DropDownListDescriptor drop)
        {
            return drop.SetTemplate("TemplateChooser").Required();
        }
    }
}
