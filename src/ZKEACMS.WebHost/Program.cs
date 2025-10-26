/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy;
using Easy.Mvc.Plugin;
using Easy.Mvc.Resource;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc.Razor.RuntimeCompilation;
using Microsoft.AspNetCore.ResponseCompression;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Options;
using Serilog;
using System;
using System.IO;

namespace ZKEACMS.WebHost
{
    public class Program
    {
        public static void Main(string[] args)
        {
            WebApplication app = BuildApplication(args);
            ConfigureApplication(app);
            app.Run();
        }

        private static WebApplication BuildApplication(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);
            //builder.Services.AddResponseCompression(options =>
            //{
            //    options.Providers.Add<BrotliCompressionProvider>();
            //    options.Providers.Add<GzipCompressionProvider>();
            //});
            Log.Logger = new LoggerConfiguration()
                .WriteTo.Console()
                .CreateLogger();

            builder.Services.AddSerilog((services, lc) => lc
                .ReadFrom.Configuration(builder.Configuration)
                .ReadFrom.Services(services)
                .Enrich.FromLogContext()
                .WriteTo.Console());

            builder.Services.ConfigureResource<DefaultResourceManager>();
            builder.Services.TryAddEnumerable(ServiceDescriptor.Singleton<IConfigureOptions<MvcRazorRuntimeCompilationOptions>, CompilationOptionsSetup>());
            Type mvcBuilderType = typeof(Builder);
            PluginActivtor.LoadedPlugins.Add(new PluginDescriptor
            {
                Assembly = mvcBuilderType.Assembly,
                PluginType = mvcBuilderType
            });
            builder.Services.UseZKEACMS(builder.Configuration, builder.Environment);

            var app = builder.Build();
            //app.UseResponseCompression();
            return app;
        }
        private static void ConfigureApplication(WebApplication app)
        {
            if (app.Environment.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Error");
                app.UseStatusCodePagesWithReExecute("/Error/Code/{0}");
            }

            app.UseZKEACMS(app.Environment, app.Services);
        }
    }
}
