/* http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy.Extend;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc.Razor;
using Microsoft.CodeAnalysis;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Options;
using System.IO;
using System.Linq;

namespace Easy.Mvc.Plugin
{
    public class PluginRazorViewEngineOptionsSetup : ConfigureOptions<RazorViewEngineOptions>
    {
        public PluginRazorViewEngineOptionsSetup(IWebHostEnvironment hostingEnvironment, IPluginLoader loader) :
            base(options =>
            {
                options.ViewLocationFormats.Clear();
                loader.GetPlugins().Where(m => m.Enable && m.ID.IsNotNullAndWhiteSpace()).Each(m =>
                {
                    var directory = new DirectoryInfo(m.RelativePath);
                    if (hostingEnvironment.IsDevelopment())
                    {
                        options.ViewLocationFormats.Add($"{DeveloperViewFileProvider.ProjectRootPath}{directory.Name}" + "/Views/{0}" + RazorViewEngine.ViewExtension);
                        options.ViewLocationFormats.Add($"{DeveloperViewFileProvider.ProjectRootPath}{directory.Name}" + "/Views/{1}/{0}" + RazorViewEngine.ViewExtension);
                        options.ViewLocationFormats.Add($"{DeveloperViewFileProvider.ProjectRootPath}{directory.Name}" + "/Views/Shared/{0}" + RazorViewEngine.ViewExtension);
                    }
                    else
                    {
                        options.ViewLocationFormats.Add($"/wwwroot/{Loader.PluginFolder}/{directory.Name}" + "/Views/{0}" + RazorViewEngine.ViewExtension);
                        options.ViewLocationFormats.Add($"/wwwroot/{Loader.PluginFolder}/{directory.Name}" + "/Views/{1}/{0}" + RazorViewEngine.ViewExtension);
                        options.ViewLocationFormats.Add($"/wwwroot/{Loader.PluginFolder}/{directory.Name}" + "/Views/Shared/{0}" + RazorViewEngine.ViewExtension);
                    }
                });
                options.ViewLocationFormats.Add("/Views/{0}" + RazorViewEngine.ViewExtension);
                options.ViewLocationFormats.Add("/Views/{1}/{0}.cshtml");
                options.ViewLocationFormats.Add("/Views/Shared/{0}.cshtml");
            })
        {

        }
    }
}