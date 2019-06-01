/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.Reflection;
using System.Text;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyModel;

namespace Easy.Mvc.Plugin
{
    public class DefaultPluginStartup : IPluginStartup
    {
        public Assembly Assembly { get; set; }
        public string CurrentPluginPath { get; set; }
        public IWebHostEnvironment HostingEnvironment { get; set; }
        public List<CompilationLibrary> Dependency { get; set; }

        public virtual void ConfigureApplication(IApplicationBuilder app, IWebHostEnvironment env)
        {

        }

        public virtual void ConfigureServices(IServiceCollection services)
        {

        }

        public virtual void Setup(params object[] args)
        {
            
        }
    }
}
