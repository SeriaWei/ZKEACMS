/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyModel;
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
        List<Assembly> Dependencies { get; set; }
        string CurrentPluginPath { get; set; }
        void Setup(params object[] args);
        void ConfigureServices(IServiceCollection services);
        void ConfigureApplication(IApplicationBuilder app, IWebHostEnvironment env);
    }
}
