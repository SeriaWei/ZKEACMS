﻿/*!
 * http://www.zkea.net/
 * Copyright 2017 ZKEASOFT
 * 深圳市纸壳软件有限公司
 * http://www.zkea.net/licenses
 */

using Easy;
using Easy.Mvc.Resource;
using Easy.RepositoryPattern;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Microsoft.Extensions.Logging;

namespace ZKEACMS.WebHost
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }
        public IConfiguration Configuration { get; }

        public void ConfigureServices(IServiceCollection services)
        {
            services.ConfigureResource<DefaultResourceManager>();

            services.AddScoped<IOnDatabaseConfiguring, EntityFrameWorkConfigure>();
            services.UseZKEACMS(Configuration);
        }

        public void Configure(IApplicationBuilder app, IHostingEnvironment env, ILoggerFactory loggerFactory, IHttpContextAccessor httpContextAccessor)
        {
            loggerFactory.AddConsole(Configuration.GetSection("Logging"));
            loggerFactory.AddDebug();

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                loggerFactory.UseFileLog(env, app.ApplicationServices.GetService<IHttpContextAccessor>());
                app.UseExceptionHandler("/Error");
            }
            app.UseZKEACMS(env, httpContextAccessor);
        }
    }
}
