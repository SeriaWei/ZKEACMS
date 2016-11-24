using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc.Razor;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.IO;
using Easy.Extend;
using Microsoft.Extensions.FileProviders;

namespace Easy.Mvc.Plugin
{
    public class PluginRazorViewEngineOptionsSetup : ConfigureOptions<RazorViewEngineOptions>
    {
        public PluginRazorViewEngineOptionsSetup(IHostingEnvironment hostingEnvironment, IPluginLoader loader) :
            base(options => ConfigureRazor(options, hostingEnvironment, loader))
        {

        }
        private static void ConfigureRazor(RazorViewEngineOptions options, IHostingEnvironment hostingEnvironment, IPluginLoader loader)
        {
            if (hostingEnvironment.IsDevelopment())
            {
                options.FileProviders.Add(new DeveloperViewFileProvider());
            }
            loader.GetPlugins().Where(m => m.Enable && m.ID.IsNotNullAndWhiteSpace()).Each(m =>
            {
                var directory = new DirectoryInfo(m.RelativePath);
                if (hostingEnvironment.IsDevelopment())
                {
                    options.ViewLocationFormats.Add($"/Porject.RootPath/{directory.Name}" + "/Views/{1}/{0}" + RazorViewEngine.ViewExtension);
                    options.ViewLocationFormats.Add($"/Porject.RootPath/{directory.Name}" + "/Views/Shared/{0}" + RazorViewEngine.ViewExtension);
                    options.ViewLocationFormats.Add($"/Porject.RootPath/{directory.Name}" + "/Views/{0}" + RazorViewEngine.ViewExtension);
                }
                else
                {
                    options.ViewLocationFormats.Add($"/{Loader.PluginFolder}/{directory.Name}" + "/Views/{1}/{0}" + RazorViewEngine.ViewExtension);
                    options.ViewLocationFormats.Add($"/{Loader.PluginFolder}/{directory.Name}" + "/Views/Shared/{0}" + RazorViewEngine.ViewExtension);
                    options.ViewLocationFormats.Add($"/{Loader.PluginFolder}/{directory.Name}" + "/Views/{0}" + RazorViewEngine.ViewExtension);
                }
                options.ViewLocationFormats.Add("/Views/{0}" + RazorViewEngine.ViewExtension);
            });

        }
    }
}