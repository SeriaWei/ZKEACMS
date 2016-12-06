using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Extensions;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.StaticFiles;
using Microsoft.Extensions.FileProviders.Physical;
using Microsoft.Extensions.Options;
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
        private readonly IHostingEnvironment _hostingEnvironment;

        public PluginStaticFileMiddleware(RequestDelegate next, IHostingEnvironment hostingEnv, IOptions<StaticFileOptions> options, IPluginLoader pluginLoader)
        {
            _next = next;
            _contentTypeProvider = options.Value.ContentTypeProvider ?? new FileExtensionContentTypeProvider();
            _pluginLoader = pluginLoader;
            _hostingEnvironment = hostingEnv;
        }

        public async Task Invoke(HttpContext context)
        {
            if (IsGetMethod(context.Request.Method) && IsPluginMatchPath(context.Request.Path) && IsSupportContentType(context.Request.Path))
            {
                string filePath = GetAbsolutePath(context.Request.Path);
                if (File.Exists(filePath))
                {
                    var sendFileFeature = context.Features.Get<IHttpSendFileFeature>();
                    if (sendFileFeature != null)
                    {
                        await sendFileFeature.SendFileAsync(filePath, 0, null, CancellationToken.None);
                    }
                    using (var readStream = new PhysicalFileInfo(new FileInfo(filePath)).CreateReadStream())
                    {
                        await StreamCopyOperation.CopyToAsync(readStream, context.Response.Body, null, CancellationToken.None);
                    }
                }

            }
            await _next(context);
        }
        private bool IsGetMethod(string method)
        {
            return string.Equals("GET", method, StringComparison.OrdinalIgnoreCase);
        }
        private bool IsPluginMatchPath(string path)
        {
            return path.StartsWith($"/{_pluginLoader.PluginFolderName()}/", StringComparison.OrdinalIgnoreCase);
        }
        private bool IsSupportContentType(string path)
        {
            string contentType;
            return _contentTypeProvider.TryGetContentType(path, out contentType);
        }
        private string GetAbsolutePath(string path)
        {
            string parentPath = new DirectoryInfo(_hostingEnvironment.ContentRootPath).Parent.FullName;
            string subPath = path.Replace($"/{_pluginLoader.PluginFolderName()}/", "/").Replace("/", "\\");
            return parentPath + subPath;
        }
    }
}
