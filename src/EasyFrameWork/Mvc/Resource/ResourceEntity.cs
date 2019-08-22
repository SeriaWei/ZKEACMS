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
using Microsoft.Extensions.Options;
using Easy.Options;
using System.Collections.Generic;
using System.Collections.Concurrent;
using Microsoft.Extensions.Primitives;
using Microsoft.Extensions.Hosting;

namespace Easy.Mvc.Resource
{
    public class ResourceEntity
    {
        class FilePathMap
        {
            public string Source { get; set; }
            public string FilePath { get; set; }
        }
        const string StyleFormt = "<link href=\"{0}\" rel=\"stylesheet\" />\r\n\t";
        const string ScriptFormt = "<script src=\"{0}\" type=\"text/javascript\"></script>\r\n\t";
        static ConcurrentDictionary<string, string> VersionMap;

        static ResourceEntity()
        {
            VersionMap = new ConcurrentDictionary<string, string>();
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
                    return _CDNSource = ReleaseSource.Replace("~", CDN.Url);
                }
                if (ReleaseSource.StartsWith("/"))
                {
                    return _CDNSource = CDN.Url.TrimEnd('/') + ReleaseSource;
                }
                return _CDNSource = CDN.Url.TrimEnd('/') + "/" + ReleaseSource;
            }
        }
        public CDNOption CDN { get; set; }
        public bool UseCNDSource
        {
            get
            {
                return CDN != null && CDN.Enable && CDN.Url.IsNotNullAndWhiteSpace();
            }
        }

        public IHtmlContent ToSource(IUrlHelper urlHelper, IWebHostEnvironment hostingEnvironment, IOptions<CDNOption> options)
        {
            if (Source != null)
            {
                return Source;
            }
            if (CDN == null)
            {
                CDN = options.Value;
            }
            string source = null;
            if (hostingEnvironment.IsDevelopment())
            {
                string debugSource = VersionSource(hostingEnvironment, DebugSource);
                switch (SourceType)
                {
                    case ResourceType.Script: source = string.Format(ScriptFormt, urlHelper.Content(debugSource)); break;
                    case ResourceType.Style: source = string.Format(StyleFormt, urlHelper.Content(debugSource)); break;
                }
            }
            else
            {
                string releaseSource = VersionSource(hostingEnvironment, ReleaseSource);
                switch (SourceType)
                {
                    case ResourceType.Script: source = string.Format(ScriptFormt, UseCNDSource ? CDNSource : urlHelper.Content(releaseSource)); break;
                    case ResourceType.Style: source = string.Format(StyleFormt, UseCNDSource ? CDNSource : urlHelper.Content(releaseSource)); break;
                }
            }
            return new HtmlString(source);
        }

        private string VersionSource(IWebHostEnvironment hostingEnvironment, string source)
        {
            return VersionMap.GetOrAdd(source, factory =>
            {
                if ((factory.StartsWith("~/") || factory.StartsWith("/")) && factory.IndexOf("?") < 0)
                {
                    const string pluginPath = "~/" + Plugin.Loader.PluginFolder + "/";
                    string filePath = null;
                    if (hostingEnvironment.IsDevelopment() && factory.StartsWith(pluginPath))
                    {
                        filePath = Directory.GetParent(hostingEnvironment.ContentRootPath).FullName.CombinePath(factory.Replace(pluginPath, ""));
                    }
                    else
                    {
                        string relatePath = source.Replace("~/", "");
                        filePath = hostingEnvironment.WebRootPath.CombinePath(relatePath);
                        hostingEnvironment.WebRootFileProvider.Watch(relatePath).RegisterChangeCallback(OnFileChange, new FilePathMap { Source = factory, FilePath = filePath });
                    }

                    return factory + "?v=" + File.GetLastWriteTime(filePath).ToFileTime().ToString("x");
                }
                return factory;
            });
        }
        private void OnFileChange(object filePath)
        {
            var map = filePath as FilePathMap;
            if (map != null)
            {
                string newValue = map.Source + "?v=" + File.GetLastWriteTime(map.FilePath).ToFileTime().ToString("x");
                string oldValue = null;
                if (VersionMap.TryGetValue(map.Source, out oldValue))
                {
                    VersionMap.TryUpdate(map.Source, newValue, oldValue);
                }
            }
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
