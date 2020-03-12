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
using System.Linq;

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

        private string _defaultCultureCode;
        public string DefaultCultureCode
        {
            get
            {
                return _defaultCultureCode ?? (_defaultCultureCode = _httpContext.RequestServices.GetService<IOptions<CultureOption>>().Value.Code);
            }
        }
        private string _cultureCode;
        public string CultureCode
        {
            get
            {
                return _cultureCode ?? (_cultureCode = _httpContext.Request.GetUserLanguages().FirstOrDefault() ?? DefaultCultureCode);
            }
        }
        public string Text { get { return Get(); } }
        private HttpContext _httpContext;
        public void WriteTo(TextWriter writer, HtmlEncoder encoder)
        {
            writer.Write(Get());
        }
        LanguageEntity Get(string content, List<string> codes)
        {
            var service = _httpContext.RequestServices.GetService<ILanguageService>();
            foreach (var item in codes)
            {
                LanguageEntity lanContent = service.Get(content, item);
                if (lanContent != null)
                {
                    return lanContent;
                }
            }
            return null;
        }
        private string Get()
        {
            if (_translatedContent.IsNotNullAndWhiteSpace())
            {
                return _translatedContent;
            }
            List<string> codes = new List<string> { CultureCode };
            if (CultureCode != DefaultCultureCode)
            {
                codes.Add(DefaultCultureCode);
            }
            var lanContent = Get(Content, codes);
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
