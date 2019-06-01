using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc.Razor.RuntimeCompilation;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.Mvc.Plugin
{
    public class MvcRazorRuntimeCompilationOptionsSetup : ConfigureOptions<MvcRazorRuntimeCompilationOptions>
    {
        public MvcRazorRuntimeCompilationOptionsSetup(IWebHostEnvironment webHostEnvironment) : base(optoins =>
        {
            optoins.FileProviders.Add(new DeveloperViewFileProvider(webHostEnvironment));
        })
        {
        }
    }
}
