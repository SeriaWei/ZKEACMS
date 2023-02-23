/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using AngleSharp;
using AngleSharp.Dom;
using AngleSharp.Html.Parser;
using Easy.Extend;
using Easy.Serializer;
using Microsoft.AspNetCore.Html;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS
{
    public class HtmlHelper
    {
        public static IDocument ParseHtml(string html)
        {
            if (html.IsNullOrEmpty()) return null;

            return new HtmlParser().ParseDocument(html);
        }

        public static HashSet<string> ParseImageUrls(string html)
        {
            HashSet<string> result = new HashSet<string>();
            if (html.IsNullOrEmpty()) return result;

            using (var doc = ParseHtml(html))
            {
                foreach (var img in doc.Images)
                {
                    var src = img.GetAttribute("src");
                    if (src.IsNullOrWhiteSpace()) continue;

                    result.Add(src);
                }
            }
            return result;
        }

        public static IHtmlContent SerializeToJsonLinkingData(object obj)
        {
            if (obj == null) return null;

            var result = new HtmlContentBuilder();
            result.AppendHtmlLine("<script type=\"application/ld+json\">");
            result.AppendHtmlLine(JsonConverter.Serialize(obj));
            result.AppendHtmlLine("</script>");
            return result;
        }
    }
}
