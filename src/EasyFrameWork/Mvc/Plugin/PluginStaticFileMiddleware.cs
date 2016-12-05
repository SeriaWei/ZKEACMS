using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.FileProviders;
using Microsoft.AspNetCore.StaticFiles;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Options;
using Microsoft.AspNetCore.Http.Features;
using System.Threading;
using System.IO;
using Microsoft.AspNetCore.Http.Extensions;
using Microsoft.Extensions.FileProviders.Physical;

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

        public Task Invoke(HttpContext context)
        {
            if (context.Request.Method == "GET" && context.Request.Path.Value.StartsWith($"/{_pluginLoader.PluginFolderName()}/"))
            {
                string contentType;
                if (_contentTypeProvider.TryGetContentType(context.Request.Path, out contentType))
                {
                    string parentPath = new DirectoryInfo(_hostingEnvironment.ContentRootPath).Parent.FullName;
                    string subPath = context.Request.Path.Value.Replace($"/{_pluginLoader.PluginFolderName()}/", "/").Replace("/", "\\");
                    string filePath = parentPath + subPath;

                    if (File.Exists(filePath))
                    {
                        var sendFileFeature = context.Features.Get<IHttpSendFileFeature>();
                        if (sendFileFeature != null)
                        {
                            return sendFileFeature.SendFileAsync(filePath, 0, null, CancellationToken.None);
                        }

                        return StreamCopyOperation.CopyToAsync(new PhysicalFileInfo(new FileInfo(filePath)).CreateReadStream(), context.Response.Body, null, CancellationToken.None);

                    }
                }
            }
            return _next(context);
        }
    }
}
