using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Easy.Mvc.Plugin
{
    public interface IPluginStartup
    {
        IHostingEnvironment HostingEnvironment { get; set; }
        void ConfigureServices(IServiceCollection services);
    }
}
