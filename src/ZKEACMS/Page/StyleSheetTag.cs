/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.Page
{
    public class StyleSheetTag : PageTag
    {
        public StyleSheetTag(string href)
        {
            Attributes.Add("rel", "stylesheet");
            Attributes.Add("type", "text/css");
            Attributes.Add("href", href);
        }
        public override string Name => "link";
        public override TagRenderMode RenderMode => TagRenderMode.SelfClosing;
    }
}
