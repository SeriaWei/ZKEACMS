using Easy.Mvc.Plugin;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc.Razor.RuntimeCompilation;
using Microsoft.Extensions.Options;
using Microsoft.Extensions.Hosting;

namespace ZKEACMS.WebHost
{
    public class CompilationOptionsSetup : ConfigureOptions<MvcRazorRuntimeCompilationOptions>
    {
        public CompilationOptionsSetup(IWebHostEnvironment webHostEnvironment) : base(optoins =>
        {
            if (webHostEnvironment.IsDevelopment())
            {
                optoins.FileProviders.Add(new DeveloperViewFileProvider(webHostEnvironment));
            }            
        })
        {
        }
    }
}
