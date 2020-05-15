using Microsoft.AspNetCore.Html;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Article.Extend
{
    public static class HtmlHelperExtend
    {
        public static IHtmlContent RawCount(this IHtmlHelper html, int count)
        {
            if (count < 1000)
            {
                return html.Raw(count);
            }
            return html.Raw($"{((double)count / 1000).ToString("F1")}k");
        }
    }
}
