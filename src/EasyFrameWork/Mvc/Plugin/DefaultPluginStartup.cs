﻿using System;
using System.Collections.Generic;
using System.Reflection;
using System.Text;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;

namespace Easy.Mvc.Plugin
{
    public class DefaultPluginStartup : IPluginStartup
    {
        public Assembly Assembly { get; set; }
        public string CurrentPluginPath { get; set; }
        public IHostingEnvironment HostingEnvironment { get; set; }

        public virtual void ConfigureApplication(IApplicationBuilder app, IHostingEnvironment env)
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
