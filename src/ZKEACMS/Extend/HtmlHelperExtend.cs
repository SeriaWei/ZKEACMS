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
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.DependencyInjection;
using Easy.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Razor;

namespace ZKEACMS
{
    public static class HtmlHelperExtend
    {
        public static async Task<IHtmlContent> DisplayWidget(this IHtmlHelper html, WidgetViewModelPart widget)
        {
            if (widget.ViewModel != null)
            {
                var logger = html.ViewContext.HttpContext.RequestServices.GetService<ILogger<WidgetViewModelPart>>();
                DateTime startTime = DateTime.Now;
                var widgetResult = await html.PartialAsync("DisplayWidget", widget);
                logger.LogInformation("Render Widget [{0}]: {1}ms", widget.Widget.ServiceTypeName, (DateTime.Now - startTime).TotalMilliseconds);
                return widgetResult;
            }
            return await html.WidgetError();
        }
        public static async Task<IHtmlContent> DisplayWidgetPart(this IHtmlHelper html, WidgetViewModelPart widget)
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
            return !link.StartsWith("http://", StringComparison.OrdinalIgnoreCase) && !link.StartsWith("https://", StringComparison.OrdinalIgnoreCase);
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
            return html.Editor(string.Empty, "Search-Terms", new { CreateAble = createAble, CreateAction = createAction });
        }
        public static IDisposable SearchTermsWithActions(this IHtmlHelper html, RazorPage page)
        {
            return new InjectEditorViewRender(page, html, "Search-Terms");
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
                else if (modelType == typeof(int))
                {
                    return html.Editor(item.PropertyName, "Int32");
                }
                else
                {
                    return html.Editor(item.PropertyName, "String");
                }
            }
        }

        public static IHtmlContent EmailLinkButton(this IHtmlHelper html, string link, string text)
        {
            return html.EmailLinkButton(link, text, false);
        }
        public static IHtmlContent EmailLinkButton(this IHtmlHelper html, string link, string text, bool center)
        {
            return html.Partial("EmailLinkButton", new Tuple<string, string, bool>(link, text, center));
        }
        public static IHtmlContent HiddenForCurrentPagePath(this IHtmlHelper html)
        {
            var request = html.ViewContext.HttpContext.Request;
            if (request.Method.Equals("GET", StringComparison.OrdinalIgnoreCase))
            {
                var pagePath = request.Query["CurrentPagePath"];
                return html.Hidden("CurrentPagePath", pagePath.Count > 0 ? pagePath : request.Path);
            }
            else
            {
                return html.Hidden("CurrentPagePath", request.Form["CurrentPagePath"]);
            }
        }

        public static string CurrencySymbol(this IHtmlHelper html)
        {
            return html.ViewContext.HttpContext.RequestServices.GetService<IApplicationContextAccessor>().Current.Currency.Symbol;
        }
        public static string CurrencyCode(this IHtmlHelper html)
        {
            return html.ViewContext.HttpContext.RequestServices.GetService<IApplicationContextAccessor>().Current.Currency.Code;
        }
    }
}
