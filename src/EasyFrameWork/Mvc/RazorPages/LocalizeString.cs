/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */
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
            _httpContext = httpContext;
        }
        public LocalizeString(string content, string cultureCode, HttpContext httpContext)
        {
            Content = content;
            _cultureCode = cultureCode;
            _httpContext = httpContext;
        }
        private string _translatedContent;
        public string Content { get; set; }
        private string _cultureCode;
        public string CultureCode
        {
            get
            {
                return _cultureCode ?? (_cultureCode = _httpContext.RequestServices.GetService<IOptions<CultureOption>>().Value.Code);
            }
        }
        public string Text { get { return Get(); } }
        private HttpContext _httpContext;
        public void WriteTo(TextWriter writer, HtmlEncoder encoder)
        {
            writer.Write(Get());
        }
        private string Get()
        {
            if (_translatedContent.IsNotNullAndWhiteSpace())
            {
                return _translatedContent;
            }
            var service = _httpContext.RequestServices.GetService<ILanguageService>();
            var lanContent = service.Get(Content, CultureCode);
            if (lanContent != null && lanContent.LanValue.IsNotNullAndWhiteSpace())
            {
                _translatedContent = lanContent.LanValue;
            }
            if (_translatedContent.IsNullOrWhiteSpace())
            {
                _translatedContent = Content;
            }
            return _translatedContent;
        }

        public override string ToString()
        {
            return this.Get();
        }
    }
}
