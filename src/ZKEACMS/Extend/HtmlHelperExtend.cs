/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Extend;
using Easy.Mvc;
using Easy.RepositoryPattern;
using ZKEACMS.Widget;
using Microsoft.AspNetCore.Html;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Threading.Tasks;

namespace ZKEACMS
{
    public static class HtmlHelperExtend
    {
        public static Task<IHtmlContent> DisPlayWidget(this IHtmlHelper html, WidgetViewModelPart widget)
        {
            if (widget.ViewModel != null)
            {
                return html.PartialAsync(widget.Widget.PartialView, widget.ViewModel);
            }
            return html.WidgetError();
        }

        public static Task<IHtmlContent> DesignWidget(this IHtmlHelper html, DesignWidgetViewModel viewModel)
        {
            return html.PartialAsync("DesignWidget", viewModel);
        }
        public static IHtmlContent SmartLink(this IHtmlHelper html, string link, string text, string cssClass = null)
        {
            if (link.IsNullOrEmpty())
            {
                link = "/";
            }
            bool self = IsOpenSelf(link);
            HtmlContentBuilder builder = new HtmlContentBuilder();
            builder.AppendHtmlLine("<a " + (cssClass.IsNullOrWhiteSpace() ? "" : "class=\"" + cssClass + "\"") + " target=\"" + (self ? "_self" : "_blank") + "\" href=\"" + link + "\">" + text + "</a>");
            return builder;
        }

        public static IHtmlContent SmartLinkTarget(this IHtmlHelper html, string link)
        {
            HtmlContentBuilder builder = new HtmlContentBuilder();
            if (link.IsNullOrEmpty())
            {
                builder.Append("_self");
                return builder;
            }
            bool self = IsOpenSelf(link);
            builder.Append(self ? "_self" : "_blank");
            return builder;
        }

        private static bool IsOpenSelf(string link)
        {
            return true;
        }

        public static Task<IHtmlContent> WidgetError(this IHtmlHelper html)
        {
            return html.PartialAsync("Widget.Error");
        }

        public static Task Pagin(this IHtmlHelper html, Pagination pagin)
        {
           return html.RenderPartialAsync("Partial_Pagination", pagin);
        }
        public static Task Pagin(this IHtmlHelper html, Pagin pagin)
        {
            return html.RenderPartialAsync("Partial_RegularPagination", pagin);
        }
    }
}
