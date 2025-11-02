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
                var stream = GetFileStream(context.Request.Path);
                if (stream == null)
                {
                    context.Response.StatusCode = 404;
                    return;
                }

                await CopyToResponseStream(context, stream);
            }
            else
            {
                await _next(context);
            }
        }

        private Stream GetFileStream(string path)
        {
            var fileInfo = GetFileInfo(path);
            if (fileInfo.Exists) return fileInfo.OpenRead();

            return GetManifestResourceStream(path);
        }

        private Stream GetManifestResourceStream(string filePath)
        {
            var plugin = _pluginLoader.GetLoadedPlugin(filePath.Split('/')[2]);
            if (plugin == null) return null;

            var resourceName = filePath.Substring($"/{_pluginLoader.GetPluginFolderName()}/".Length).Replace('/', '.');
            if (!plugin.EmbeddedResource.TryGetValue(resourceName, out string actualResourceName)) return null;

            return plugin.Assembly.GetManifestResourceStream(actualResourceName);
        }

        private static async Task CopyToResponseStream(HttpContext context, Stream resourceStream)
        {
            using (resourceStream)
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
        }

        private bool IsGetMethod(string method)
        {
            return string.Equals("GET", method, StringComparison.OrdinalIgnoreCase);
        }
        private bool IsPluginMatchPath(string path)
        {
            return path.StartsWith($"/{_pluginLoader.GetPluginFolderName()}/", StringComparison.OrdinalIgnoreCase);
        }

        private bool IsSupportContentType(HttpContext context)
        {
            string contentType;
            if (_contentTypeProvider.TryGetContentType(context.Request.Path, out contentType))
            {
                if (IsTextContentType(contentType))
                {
                    context.Response.ContentType = $"{contentType}; charset=utf-8";
                }
                else
                {
                    context.Response.ContentType = contentType;
                }
                return true;
            }
            return false;
        }

        private bool IsTextContentType(string contentType)
        {
            var textContentTypes = new[]
            {
                "text/plain","text/html","text/css",
                "text/javascript", "application/javascript","application/json",
                "application/xml", "text/xml","text/csv"
            };

            return textContentTypes.Any(t => contentType.StartsWith(t, StringComparison.OrdinalIgnoreCase));
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
