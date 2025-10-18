/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Extend;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Extensions;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.StaticFiles;
using Microsoft.Extensions.FileProviders.Physical;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Options;
using Microsoft.Extensions.Primitives;
using System;
using System.IO;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace Easy.Mvc.Plugin
{
    public class PluginStaticFileMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly IContentTypeProvider _contentTypeProvider;
        private readonly IPluginLoader _pluginLoader;
        private readonly IWebHostEnvironment _hostingEnvironment;

        public PluginStaticFileMiddleware(RequestDelegate next, IOptions<StaticFileOptions> options, IPluginLoader pluginLoader, IWebHostEnvironment hostingEnvironment)
        {
            _next = next;
            _contentTypeProvider = options.Value.ContentTypeProvider ?? new FileExtensionContentTypeProvider();
            _pluginLoader = pluginLoader;
            _hostingEnvironment = hostingEnvironment;
        }

        public async Task Invoke(HttpContext context)
        {
            if (IsGetMethod(context.Request.Method) && IsPluginMatchPath(context.Request.Path) && IsSupportContentType(context))
            {
                string filePath = context.Request.Path;
                var fileInfo = GetFileInfo(filePath);
                if (fileInfo.Exists)
                {
                    using (var fileStream = fileInfo.OpenRead())
                    {
                        await WriteStream(context, fileStream);
                    }
                }
                else
                {
                    using (var fileStream = GetManifestResourceStream(filePath))
                    {
                        if (fileStream != null)
                        {
                            await WriteStream(context, fileStream);
                        }
                    }
                }                    
            }
            else
            {
                await _next(context);
            }
        }

        private Stream GetManifestResourceStream(string filePath)
        {
            foreach (var plugin in _pluginLoader.GetPlugins().Where(p => p.Enable))
            {
                if (!filePath.StartsWith($"/{_pluginLoader.PluginFolderName()}/{plugin.Name}/")) continue;

                var resourceName = filePath.Substring($"/{_pluginLoader.PluginFolderName()}/".Length).Replace('/', '.');
                if (!plugin.EmbeddedResource.TryGetValue(resourceName, out string actualResourceName)) continue;

                var resourceStream = plugin.Assembly.GetManifestResourceStream(actualResourceName);
                if (resourceStream == null) continue;

                return resourceStream;
            }
            return null;
        }

        private static async Task WriteStream(HttpContext context, Stream resourceStream)
        {
            context.Response.ContentLength = resourceStream.Length;
            context.Response.StatusCode = 200;
            var sendFileFeature = context.Features.Get<IHttpResponseBodyFeature>();
            if (sendFileFeature != null)
            {
                await resourceStream.CopyToAsync(sendFileFeature.Stream);
            }
            else
            {
                await resourceStream.CopyToAsync(context.Response.Body);
            }
        }

        private bool IsGetMethod(string method)
        {
            return string.Equals("GET", method, StringComparison.OrdinalIgnoreCase);
        }
        private bool IsPluginMatchPath(string path)
        {
            return path.StartsWith($"/{_pluginLoader.PluginFolderName()}/", StringComparison.OrdinalIgnoreCase);
        }

        private bool IsSupportContentType(HttpContext context)
        {
            string contentType;
            if (_contentTypeProvider.TryGetContentType(context.Request.Path, out contentType))
            {
                context.Response.ContentType = contentType;
                return true;
            }
            return false;
        }

        private FileInfo GetFileInfo(string path)
        {
            if (_hostingEnvironment.IsDevelopment())
            {
                string parentPath = new DirectoryInfo(_hostingEnvironment.ContentRootPath).Parent.FullName;
                return new FileInfo(parentPath.CombinePath(path));
            }
            return new FileInfo(_hostingEnvironment.ContentRootPath.CombinePath(path));
        }
    }
}
