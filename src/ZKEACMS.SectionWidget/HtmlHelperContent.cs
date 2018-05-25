/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */

using Microsoft.AspNetCore.Mvc.Rendering;
using ZKEACMS.SectionWidget.Models;

namespace ZKEACMS.SectionWidget
{
    public static class HtmlHelperContent
    {
        public static void RenderContent(this IHtmlHelper html, SectionContent content)
        {
            if (content != null && content.SectionContentType > 0)
            {
                html.RenderPartialAsync("SectionPartial." + ((SectionContentBase.Types)content.SectionContentType), content).GetAwaiter().GetResult();
            }
        }

        public static void RenderEditContent(this IHtmlHelper html, SectionContent content)
        {
            if (content != null && content.SectionContentType > 0)
            {
                html.RenderPartialAsync("SectionPartial." + ((SectionContentBase.Types)content.SectionContentType + ".Edit"), content).GetAwaiter().GetResult();
            }
        }
    }
}