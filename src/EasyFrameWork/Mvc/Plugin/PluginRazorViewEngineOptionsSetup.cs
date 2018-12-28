/* http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy.Extend;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc.Razor;
using Microsoft.CodeAnalysis;
using Microsoft.Extensions.Options;
using System.IO;
using System.Linq;

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
                options.FileProviders.Add(new DeveloperViewFileProvider(hostingEnvironment));
            }
            //loader.GetPluginAssemblies().Each(assembly =>
            //{
            //    var reference = MetadataReference.CreateFromFile(assembly.Location);
            //    options.AdditionalCompilationReferences.Add(reference);                
            //});
            //options.CompilationCallback = context =>
            //{
            //    var reference = MetadataReference.CreateFromFile(@"D:\Projects\ZKEACMS.Core\src\TestAss\bin\Debug\netstandard1.6\TestAss.dll");

            //    context.Compilation = context.Compilation.AddReferences(reference);
            //};
            loader.GetPlugins().Where(m => m.Enable && m.ID.IsNotNullAndWhiteSpace()).Each(m =>
            {
                var directory = new DirectoryInfo(m.RelativePath);
                if (hostingEnvironment.IsDevelopment())
                {
                    options.ViewLocationFormats.Add($"{DeveloperViewFileProvider.ProjectRootPath}{directory.Name}" + "/Views/{1}/{0}" + RazorViewEngine.ViewExtension);
                    options.ViewLocationFormats.Add($"{DeveloperViewFileProvider.ProjectRootPath}{directory.Name}" + "/Views/Shared/{0}" + RazorViewEngine.ViewExtension);
                    options.ViewLocationFormats.Add($"{DeveloperViewFileProvider.ProjectRootPath}{directory.Name}" + "/Views/{0}" + RazorViewEngine.ViewExtension);
                }
                else
                {
                    options.ViewLocationFormats.Add($"/wwwroot/{Loader.PluginFolder}/{directory.Name}" + "/Views/{1}/{0}" + RazorViewEngine.ViewExtension);
                    options.ViewLocationFormats.Add($"/wwwroot/{Loader.PluginFolder}/{directory.Name}" + "/Views/Shared/{0}" + RazorViewEngine.ViewExtension);
                    options.ViewLocationFormats.Add($"/wwwroot/{Loader.PluginFolder}/{directory.Name}" + "/Views/{0}" + RazorViewEngine.ViewExtension);
                }
            });
            options.ViewLocationFormats.Add("/Views/{0}" + RazorViewEngine.ViewExtension);
        }
    }
}