/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy;
using Easy.Extend;
using Easy.Mvc.Plugin;
using Easy.Mvc.Resource;
using Easy.StartTask;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Linq;
using ZKEACMS.Captcha;
using ZKEACMS.Route;

namespace ZKEACMS
{
    public static class Builder
    {
        public static void UseZKEACMS(this IServiceCollection services, IConfiguration configuration, IWebHostEnvironment webHostEnvironment)
        {
            IMvcBuilder mvcBuilder = services.ConfigMVC();

            services.AddRouteDataProvider();
            services.ConfigCMS(configuration);
            services.ConfigMetaData();
            services.ConfigEvents();
            services.ConfigCaptcha();
            services.ConfigDatabase(configuration);
            services.UseEasyFrameWork(configuration);
            services.ConfigPlugin(webHostEnvironment, mvcBuilder);
            services.ConfigAuthentication();
        }

        public static void UseZKEACMS(this IApplicationBuilder applicationBuilder, IWebHostEnvironment hostingEnvironment, IServiceProvider serviceProvider)
        {
            if (hostingEnvironment.IsDevelopment())
            {
                applicationBuilder.UsePluginStaticFile();
            }
            applicationBuilder.UseStaticFiles();
            ServiceLocator.Setup(serviceProvider);
            applicationBuilder.ConfigureResource();
            applicationBuilder.ConfigurePlugin(hostingEnvironment);
            applicationBuilder.UseSession();
            applicationBuilder.UseRouting();

            applicationBuilder.UseAuthentication();
            applicationBuilder.UseAuthorization();

            applicationBuilder.UseEndpoints(endpoints =>
            {
                applicationBuilder.ApplicationServices.GetService<IRouteProvider>().GetRoutes().OrderByDescending(route => route.Priority).Each(route =>
                {
                    endpoints.MapControllerRoute(
                        name: route.RouteName,
                        pattern: route.Template,
                        defaults: route.Defaults,
                        constraints: route.Constraints,
                        dataTokens: route.DataTokens);
                });

                endpoints.MapRazorPages();
            });
            using (var scope = applicationBuilder.ApplicationServices.CreateScope())
            {
                foreach (IStartTask task in scope.ServiceProvider.GetServices<IStartTask>())
                {
                    task.Excute();
                }
            }

            System.IO.Directory.SetCurrentDirectory(hostingEnvironment.ContentRootPath);
            Console.WriteLine("Welcome to use ZKEACMS");
        }
    }
}
