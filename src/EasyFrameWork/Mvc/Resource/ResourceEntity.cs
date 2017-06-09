/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Mvc.Resource.Enums;
using System;
using System.IO;
using Easy.Extend;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Html;
using Microsoft.AspNetCore.Mvc.Razor;
using Microsoft.AspNetCore.Mvc.Routing;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Configuration;

namespace Easy.Mvc.Resource
{
    public class ResourceEntity
    {
        const string StyleFormt = "<link href=\"{0}\" rel=\"stylesheet\" />";
        const string ScriptFormt = "<script src=\"{0}\" type=\"text/javascript\"></script>";
        static readonly IConfigurationSection CNDSetting;
        static ResourceEntity()
        {
            CNDSetting = Builder.Configuration.GetSection("CDN");
        }
        public ResourcePosition Position { get; set; }
        public IHtmlContent Source { get; set; }

        public ResourceType SourceType { get; set; }
        public string ReleaseSource { get; set; }
        public string DebugSource { get; set; }
        private string _CDNSource;
        public string CDNSource
        {
            get
            {
                if (_CDNSource.IsNotNullAndWhiteSpace())
                {
                    return _CDNSource;
                }
                if (ReleaseSource.StartsWith("http"))
                {
                    return _CDNSource = ReleaseSource;
                }
                if (ReleaseSource.StartsWith("~"))
                {
                    return _CDNSource = ReleaseSource.Replace("~", CNDSetting["Url"]);
                }
                if (ReleaseSource.StartsWith("/"))
                {
                    return _CDNSource = CNDSetting["Url"].TrimEnd('/') + ReleaseSource;
                }
                return _CDNSource = CNDSetting["Url"].TrimEnd('/') + "/" + ReleaseSource;
            }
        }
        public IUrlHelper UrlHelper { get; private set; }
        public IHostingEnvironment HostingEnvironment { get; private set; }
        public bool UseCNDSource
        {
            get
            {
                return CNDSetting != null && CNDSetting["Enable"].Equals("true", StringComparison.OrdinalIgnoreCase) && CNDSetting["Url"].IsNotNullAndWhiteSpace();
            }
        }

        public IHtmlContent ToSource<T>(RazorPage<T> page)
        {
            if (Source != null)
            {
                return Source;
            }
            if (UrlHelper == null)
            {
                UrlHelper = page.Context.RequestServices.GetService<IUrlHelperFactory>().GetUrlHelper(page.ViewContext);
            }
            if (HostingEnvironment == null)
            {
                HostingEnvironment = page.Context.RequestServices.GetService<IHostingEnvironment>();
            }
            string source = null;
            if (System.Diagnostics.Debugger.IsAttached || HostingEnvironment.IsDevelopment())
            {
                switch (SourceType)
                {
                    case ResourceType.Script: source = string.Format(ScriptFormt, UrlHelper.Content(DebugSource)); break;
                    case ResourceType.Style: source = string.Format(StyleFormt, UrlHelper.Content(DebugSource)); break;
                }
            }
            else
            {
                switch (SourceType)
                {
                    case ResourceType.Script: source = string.Format(ScriptFormt, UseCNDSource ? CDNSource : UrlHelper.Content(ReleaseSource)); break;
                    case ResourceType.Style: source = string.Format(StyleFormt, UseCNDSource ? CDNSource : UrlHelper.Content(ReleaseSource)); break;
                }
            }
            return new HtmlString(source);
        }

        public ResourceEntity ToNew()
        {
            return new ResourceEntity()
            {
                Position = Position,
                Source = Source,
                SourceType = SourceType,
                ReleaseSource = ReleaseSource,
                DebugSource = DebugSource
            };
        }
    }
}
