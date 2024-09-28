/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Microsoft.AspNetCore.Html;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.Page
{
    public class StyleTag : PageTag
    {
        public StyleTag(string innerStyle) : base()
        {
            InnerStyle = new HtmlString(innerStyle);
        }
        public override string Name => "style";
        public IHtmlContent InnerStyle { get { return InnerHtml; } set { InnerHtml = value; } }
    }
}
