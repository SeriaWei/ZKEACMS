using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;

namespace Easy.Mvc.Plugin
{
    public interface IPluginStartup
    {
        Assembly Assembly { get; set; }
        string CurrentPluginPath { get; set; }
        IHostingEnvironment HostingEnvironment { get; set; }
        void ConfigureServices(IServiceCollection services);
        void ConfigureApplication(IApplicationBuilder app, IHostingEnvironment env);
    }
}
