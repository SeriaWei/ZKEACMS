﻿/* http://www.zkea.net/ 
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
    public class PageContext : IPageContext
    {
        public string Title { get; set; }
        public string CultureCode { get; set; }

        public List<MetaTag> Meta { get; } = new List<MetaTag>();

        public List<StyleTag> Style { get; } = new List<StyleTag>();

        public List<StyleSheetTag> StyleSheets { get; } = new List<StyleSheetTag>();

        public List<ScriptTag> HeaderScripts { get; } = new List<ScriptTag>();

        public List<ScriptTag> FooterScripts { get; } = new List<ScriptTag>();

        public List<IHtmlContent> Header { get; } = new List<IHtmlContent>();
        public List<IHtmlContent> BodyFooter { get; } = new List<IHtmlContent>();
        public List<string> StyleSource { get; }= new List<string>();
        public List<string> ScriptSource { get; } = new List<string>();
    }
}