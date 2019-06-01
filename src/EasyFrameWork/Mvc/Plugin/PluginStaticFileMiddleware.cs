/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */
using Easy.Extend;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Extensions;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.StaticFiles;
using Microsoft.Extensions.FileProviders.Physical;
using Microsoft.Extensions.Options;
using Microsoft.Extensions.Primitives;
using System;
using System.IO;
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

        public PluginStaticFileMiddleware(RequestDelegate next, IWebHostEnvironment hostingEnv, IOptions<StaticFileOptions> options, IPluginLoader pluginLoader)
        {
            _next = next;
            _contentTypeProvider = options.Value.ContentTypeProvider ?? new FileExtensionContentTypeProvider();
            _pluginLoader = pluginLoader;
            _hostingEnvironment = hostingEnv;
        }

        public Task Invoke(HttpContext context)
        {
            if (IsGetMethod(context.Request.Method) && IsPluginMatchPath(context.Request.Path) && IsSupportContentType(context))
            {
                string filePath = GetAbsolutePath(context.Request.Path);
                if (File.Exists(filePath))
                {
                    var file = new PhysicalFileInfo(new FileInfo(filePath));
                    context.Response.ContentLength = file.Length;
                    context.Response.StatusCode = 200;
                    var sendFileFeature = context.Features.Get<IHttpSendFileFeature>();
                    if (sendFileFeature != null)
                    {
                        return sendFileFeature.SendFileAsync(filePath, 0, file.Length, CancellationToken.None);
                    }
                    using (var readStream = file.CreateReadStream())
                    {
                        var task = StreamCopyOperation.CopyToAsync(readStream, context.Response.Body, file.Length, 64 * 1024, context.RequestAborted);
                        task.Wait();
                        return task;
                    }
                }

            }
            return _next(context);
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
        private string GetAbsolutePath(string path)
        {
            string parentPath = new DirectoryInfo(_hostingEnvironment.ContentRootPath).Parent.FullName;
            string subPath = path.Replace($"/{_pluginLoader.PluginFolderName()}/", "/").ToFilePath();
            return parentPath.CombinePath(subPath);
        }
    }
}
