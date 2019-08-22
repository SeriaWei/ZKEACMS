/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Extend;
using Easy.Mvc;
using Easy.RepositoryPattern;
using ZKEACMS.Widget;
using Microsoft.AspNetCore.Html;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Easy.Mvc.Extend;
using System;

namespace ZKEACMS
{
    public static class HtmlHelperExtend
    {
        public static async Task<IHtmlContent> DisPlayWidget(this IHtmlHelper html, WidgetViewModelPart widget)
        {
            if (widget.ViewModel != null)
            {
                return await html.PartialAsync(widget.Widget.PartialView, widget.ViewModel);
            }
            return await html.WidgetError();
        }

        public static async Task<IHtmlContent> DesignWidget(this IHtmlHelper html, DesignWidgetViewModel viewModel)
        {
            return await html.PartialAsync("DesignWidget", viewModel);
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

        public static async Task<IHtmlContent> WidgetError(this IHtmlHelper html)
        {
            return await html.PartialAsync("Widget.Error");
        }

        public static async Task Pagin(this IHtmlHelper html, Pagination pagin)
        {
            await html.RenderPartialAsync("Partial_Pagination", pagin);
        }
        public static async Task Pagin(this IHtmlHelper html, Pagin pagin)
        {
            await html.RenderPartialAsync("Partial_RegularPagination", pagin);
        }
        public static IHtmlContent SearchTerms(this IHtmlHelper html, bool createAble)
        {
            return html.SearchTerms(createAble, "Create");
        }
        public static IHtmlContent SearchTerms(this IHtmlHelper html, bool createAble, string createAction)
        {
            html.ViewBag.CreateAble = createAble;
            html.ViewBag.CreateAction = createAction;
            return html.Editor(string.Empty, "Search-Terms");
        }

        public static IHtmlContent SearchItem(this IHtmlHelper html, ModelMetadata item)
        {
            var descriptor = item.GetViewDescriptor();
            if (descriptor is Easy.ViewPort.Descriptor.DropDownListDescriptor)
            {
                return html.Editor(item.PropertyName, "DropDownList");
            }
            else
            {
                if (!descriptor.Classes.Contains("form-control"))
                {
                    descriptor.Classes.Add("form-control");
                }
                Type modelType = descriptor.DataType;

                if (modelType == typeof(DateTime))
                {
                    return html.Editor(item.PropertyName, "DateTime");
                }
                else if (modelType == typeof(bool))
                {
                    return html.Editor(item.PropertyName, "DropdownBoolen");
                }
                else if (modelType == typeof(decimal))
                {
                    return html.Editor(item.PropertyName, "Decimal");
                }
                else if (modelType == typeof(Int32))
                {
                    return html.Editor(item.PropertyName, "Int32");
                }
                else
                {
                    return html.Editor(item.PropertyName, "String");
                }
            }
        }
    }
}
