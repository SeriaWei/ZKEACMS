/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Microsoft.AspNetCore.Html;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.Encodings.Web;
using System.Threading.Tasks;

namespace ZKEACMS.Page
{
    public abstract class PageTag
    {
        public abstract string Name { get; }
        public Dictionary<string, string> Attributes { get; set; } = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
        protected IHtmlContent InnerHtml { get; set; }
        public virtual TagRenderMode RenderMode { get; } = TagRenderMode.Normal;
        public virtual IHtmlContent Render()
        {
            TagBuilder tagBuilder = new TagBuilder(Name);
            tagBuilder.TagRenderMode = RenderMode;
            tagBuilder.MergeAttributes(Attributes);
            if (InnerHtml != null)
            {
                tagBuilder.InnerHtml.AppendHtml(InnerHtml);
            }

            return tagBuilder;
        }
    }
}