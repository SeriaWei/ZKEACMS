/*!
 * http://www.zkea.net/
 * Copyright 2017 ZKEASOFT
 * 深圳市纸壳软件有限公司
 * http://www.zkea.net/licenses
 */

using Easy;
using Easy.Extend;
using Easy.Mvc.Authorize;
using Easy.Mvc.DataAnnotations;
using Easy.RepositoryPattern;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Microsoft.Extensions.Logging;
using System.Linq;
using ZKEACMS.ModelBinder;

namespace ZKEACMS.WebHost
{
    public class Startup
    {
        public Startup(IHostingEnvironment env)
        {
            var builder = new ConfigurationBuilder()
             .SetBasePath(env.ContentRootPath)
             .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
             .AddJsonFile($"appsettings.{env.EnvironmentName}.json", optional: true)
             .AddEnvironmentVariables();

            if (env.IsDevelopment())
            {
                // This will push telemetry data through Application Insights pipeline faster, allowing you to view results immediately.
                builder.AddApplicationInsightsSettings(developerMode: true);
            }
            HostingEnvironment = env;
            Configuration = builder.Build();

        }

        public IHostingEnvironment HostingEnvironment { get; }
        public IConfigurationRoot Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            // Add framework services.
            services.AddApplicationInsightsTelemetry(Configuration);

            services.AddMvc(option =>
              {
                  option.ModelBinderProviders.Insert(0, new WidgetModelBinderProvider());
                  option.ModelMetadataDetailsProviders.Add(new DataAnnotationsMetadataProvider());
              })
             .AddControllersAsServices()
             .AddJsonOptions(option =>
             {
                 option.SerializerSettings.DateFormatString = "yyyy-MM-dd";
             });
            services.TryAddTransient<IOnConfiguring, EntityFrameWorkConfigure>();

            services.UseEasyFrameWork(Configuration, HostingEnvironment).LoadEnablePlugins(plugin =>
             {
                 var cmsPlugin = plugin as PluginBase;
                 if (cmsPlugin != null)
                 {
                     cmsPlugin.InitPlug();
                 }
             }, null);
            services.UseZKEACMS();
            services.Configure<AuthorizationOptions>(options =>
            {
                PermissionKeys.KnownPermissions.Each(p =>
                {
                    options.AddPolicy(p.Key, configure =>
                    {
                        configure.Requirements.Add(new RoleRequirement { Policy = p.Key });
                    });
                });
            });

            services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
                .AddCookie(o =>
                {
                    o.LoginPath = new PathString("/Account/Login");
                    o.AccessDeniedPath = new PathString("/Error/Forbidden");
                });

            new ResourceManager().Excute();
        }

        public void Configure(IApplicationBuilder app, IHostingEnvironment env, ILoggerFactory loggerFactory)
        {
            loggerFactory.AddConsole(Configuration.GetSection("Logging"));
            loggerFactory.AddDebug();
            ServiceLocator.HttpContextAccessor = app.ApplicationServices.GetService<IHttpContextAccessor>();

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseBrowserLink();
                app.UsePluginStaticFile();
            }
            else
            {
                loggerFactory.UseFileLog(env);
                app.UseExceptionHandler("/Error");
            }

            app.UseStaticFiles();

            app.UseMvc(routes =>
            {
                app.ApplicationServices.GetService<IRouteProvider>().GetRoutes().OrderByDescending(route => route.Priority).Each(route =>
                  {
                      routes.MapRoute(route.RouteName, route.Template, route.Defaults, route.Constraints, route.DataTokens);
                  });
            });
        }
    }
}
