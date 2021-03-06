/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy;
using Easy.Mvc.Plugin;
using Easy.Mvc.Resource;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Razor.RuntimeCompilation;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using System;
using ZKEACMS.DbConnectionPool;

namespace ZKEACMS.WebHost
{
    public class Startup
    {
        public Startup(IConfiguration configuration, IWebHostEnvironment env)
        {
            Configuration = configuration;
            WebHostEnvironment = env;
        }
        public IConfiguration Configuration { get; }
        public IWebHostEnvironment WebHostEnvironment { get; }

        public void ConfigureServices(IServiceCollection services)
        {
            services.ConfigureResource<DefaultResourceManager>();
            services.TryAddEnumerable(ServiceDescriptor.Singleton<IConfigureOptions<MvcRazorRuntimeCompilationOptions>, CompilationOptionsSetup>());
            Type mvcBuilderType = typeof(Builder);
            Easy.Mvc.Plugin.PluginActivtor.LoadedPlugins.Add(new PluginDescriptor
            {
                Assembly = mvcBuilderType.Assembly,
                PluginType = mvcBuilderType
            });
            services.UseZKEACMS(Configuration, WebHostEnvironment);
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, ILoggerFactory loggerFactory, IHttpContextAccessor httpContextAccessor)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Error");
                app.UseStatusCodePagesWithReExecute("/Error/Code/{0}");
            }
            loggerFactory.UseFileLog(env, app.ApplicationServices.GetService<IHttpContextAccessor>());
            app.UseZKEACMS(env, httpContextAccessor);
        }
    }
}
