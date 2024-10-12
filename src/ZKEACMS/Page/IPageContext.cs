/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Extend;
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
        string Title { get; set; }
        string MetaKeyWorlds { get; set; }
        string MetaDescription { get; set; }
        string CultureCode { get; set; }
        List<MetaTag> Meta { get; }
        List<StyleTag> Style { get; }
        List<StyleSheetTag> StyleSheets { get; }
        List<IHtmlContent> Header { get; }
        List<ScriptTag> HeaderScripts { get; }
        List<ScriptTag> FooterScripts { get; }
        List<IHtmlContent> BodyFooter { get; }
        List<string> StyleNames { get; }
        List<string> ScriptNames { get; }
        void ConfigSEO(string title, string keywords, string description);
    }
}
