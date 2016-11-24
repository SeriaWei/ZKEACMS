using Easy.Mvc.Plugin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;

namespace ModulePart
{
    public class Plugin : IPluginStartup
    {
        public void ConfigureServices(IServiceCollection services)
        {
            
        }
    }
}
