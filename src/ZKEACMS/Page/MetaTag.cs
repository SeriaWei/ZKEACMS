/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using AngleSharp.Common;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc.TagHelpers;
using Microsoft.AspNetCore.Routing;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.Page
{
    public class MetaTag : PageTag
    {
        public MetaTag(object obj)
        {
            foreach (var item in obj.ToDictionary())
            {
                Attributes[item.Key.Replace("_", "-")] = item.Value;
            }
        }
        public override TagRenderMode RenderMode => TagRenderMode.SelfClosing;
        public override string Name => "meta";
    }
}
