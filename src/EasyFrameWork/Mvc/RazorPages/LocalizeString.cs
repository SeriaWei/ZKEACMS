using Microsoft.AspNetCore.Html;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Text.Encodings.Web;
using Microsoft.Extensions.DependencyInjection;
using Easy.Modules.MutiLanguage;
using Easy.Options;
using Microsoft.Extensions.Options;
using Easy.Extend;

namespace Easy.Mvc.RazorPages
{
    public class LocalizeString : IHtmlContent
    {
        public LocalizeString(string content, HttpContext httpContext)
        {
            Content = content;
            HttpContext = httpContext;
        }
        public string Content { get; set; }
        public HttpContext HttpContext { get; set; }
        public void WriteTo(TextWriter writer, HtmlEncoder encoder)
        {
            writer.Write(Get());
        }
        private string Get()
        {
            string lanCode = HttpContext.RequestServices.GetService<IOptions<CultureOption>>().Value.Code;
            var service = HttpContext.RequestServices.GetService<ILanguageService>();
            var lanContent = service.Get(Content, lanCode);
            if (lanContent != null && lanContent.LanValue.IsNotNullAndWhiteSpace())
            {
                return lanContent.LanValue;
            }
            return Content;
        }
        public static implicit operator string(LocalizeString localizeString)
        {
            return localizeString.Get();
        }
    }
}
