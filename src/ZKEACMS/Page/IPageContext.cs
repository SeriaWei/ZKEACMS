/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Microsoft.AspNetCore.Html;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.Page
{
    public interface IPageContext
    {
        public string Title { get; set; }
        public string CultureCode { get; set; }
        List<MetaTag> Meta { get; }
        List<StyleTag> Style { get; }
        List<StyleSheetTag> StyleSheets { get; }
        List<IHtmlContent> Header { get; }
        List<ScriptTag> HeaderScripts { get; }

        List<ScriptTag> FooterScripts { get; }
        public List<IHtmlContent> BodyFooter { get; }
        public List<string> StyleSource { get; }
        public List<string> ScriptSource { get; }
    }
}
