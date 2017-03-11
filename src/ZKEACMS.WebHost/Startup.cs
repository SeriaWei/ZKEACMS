using Easy;
using Easy.Extend;
using Easy.Mvc.Authorize;
using Easy.Mvc.DataAnnotations;
using Easy.RepositoryPattern;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System.Linq;
using ZKEACMS.Common.Service;
using ZKEACMS.MetaData;
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
            Easy.Mvc.Plugin.Loader.HostingEnvironment = env;
            Configuration = builder.Build();

        }

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
            services.UseEasyFrameWork(Configuration).LoadEnablePlugins(plugin =>
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
            services.AddAuthorization();
            services.AddDataProtection();
            new ResourceManager().Excute();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env, ILoggerFactory loggerFactory)
        {
            //ServiceLocator.Current = app.ApplicationServices;
            loggerFactory.AddConsole(Configuration.GetSection("Logging"));
            loggerFactory.AddDebug();
            

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseBrowserLink();
                app.UsePluginStaticFile();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
            }

            app.UseCookieAuthentication(new CookieAuthenticationOptions
            {
                AuthenticationScheme = "Cookie",
                LoginPath = new PathString("/Account/Login"),
                AccessDeniedPath = new PathString("/Error/Forbidden"),
                AutomaticAuthenticate = true,
                AutomaticChallenge = true
            });
            

            app.UseStaticFiles();

            app.UseMvc(routes =>
            {
                //routes.MapRoute(
                //    name: "default",
                //    template: "{controller=Home}/{action=Index}/{id?}");

                app.ApplicationServices.GetService<IRouteProvider>().GetRoutes().OrderByDescending(route => route.Priority).Each(route =>
                  {
                      routes.MapRoute(route.RouteName, route.Template, route.Defaults, route.Constraints, route.DataTokens);
                  });
            });
        }
    }
}
