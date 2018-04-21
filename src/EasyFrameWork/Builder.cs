using Easy.Mvc.Plugin;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Microsoft.AspNetCore.Mvc.Razor;
using Microsoft.Extensions.Options;
using Microsoft.AspNetCore.Mvc.Abstractions;
using Microsoft.Extensions.Configuration;
using Easy.Mvc.ValueProvider;
using Easy.RepositoryPattern;
using Easy.Modules.User.Service;
using Easy.Modules.Role;
using Easy.Modules.DataDictionary;
using Easy.Modules.MutiLanguage;
using Easy.Mvc.Authorize;
using Easy.Encrypt;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Logging;
using Easy.Logging;
using Easy.Options;
using Easy.Mvc.RazorPages;
using Easy.Notification;
using Microsoft.AspNetCore.Authorization;
using System.Text.Encodings.Web;
using System.Text.Unicode;
using System.Collections.Generic;
using Easy.Modules.User.Models;
using Easy.MetaData;

namespace Easy
{
    public static class Builder
    {
        public static void UseEasyFrameWork(this IServiceCollection services, IConfigurationRoot configuration)
        {
            services.TryAddEnumerable(ServiceDescriptor.Transient<IConfigureOptions<RazorViewEngineOptions>, PluginRazorViewEngineOptionsSetup>());

            services.Replace(ServiceDescriptor.Transient<IControllerActivator, Mvc.Controllers.ServiceBasedControllerActivator>());
            services.TryAddEnumerable(ServiceDescriptor.Transient<IActionDescriptorProvider, ActionDescriptorProvider>());
            services.TryAddSingleton<IPluginLoader, Loader>();


            services.TryAddTransient<IAuthorizer, DefaultAuthorizer>();

            services.TryAddTransient<ICookie, Cookie>();
            services.TryAddTransient<IUserService, UserService>();
            services.TryAddTransient<IRoleService, RoleService>();
            services.TryAddTransient<IUserRoleRelationService, UserRoleRelationService>();
            services.TryAddTransient<IPermissionService, PermissionService>();
            services.TryAddTransient<IDataDictionaryService, DataDictionaryService>();
            services.TryAddTransient<ILanguageService, LanguageService>();
            services.TryAddTransient<IEncryptService, EncryptService>();
            services.AddScoped<IOnModelCreating, EntityFrameWorkModelCreating>();

            services.AddTransient<IViewRenderService, ViewRenderService>();
            services.AddTransient<INotificationManager, NotificationManager>();
            services.AddTransient<INotifyService, EmailNotifyService>();
            services.AddTransient<INotifyService, RazorEmailNotifyService>();
            services.AddTransient<IPluginLoader, Loader>();
            services.AddSingleton<IAuthorizationHandler, RolePolicyRequirementHandler>();
            services.AddSingleton(HtmlEncoder.Create(UnicodeRanges.All));

            services.ConfigureMetaData<UserEntity, UserMetaData>();
            services.ConfigureMetaData<DataDictionaryEntity, DataDictionaryEntityMetaData>();
            services.ConfigureMetaData<LanguageEntity, LanguageEntityMetaData>();
            services.ConfigureMetaData<Permission, PermissionMetaData>();
            services.ConfigureMetaData<RoleEntity, RoleMetaData>();
            services.ConfigureMetaData<UserRoleRelation, UserRoleRelationMetaData>();


            services.Configure<CDNOption>(configuration.GetSection("CDN"));
            services.Configure<CultureOption>(configuration.GetSection("Culture"));

            services.AddDataProtection();

            services.AddDbContext<EasyDbContext>();
        }

        public static void ConfigureMetaData<TEntity, TMetaData>(this IServiceCollection service)
            where TMetaData : ViewMetaData<TEntity>
            where TEntity : class
        {
            service.AddTransient<ViewMetaData<TEntity>, TMetaData>();
        }

        public static IEnumerable<IPluginStartup> LoadAvailablePlugins(this IServiceCollection services)
        {
            var pluginStartup = ActivatorUtilities.GetServiceOrCreateInstance<IPluginLoader>(services.BuildServiceProvider());
            return pluginStartup.LoadEnablePlugins(services);
        }

        public static IApplicationBuilder UsePluginStaticFile(this IApplicationBuilder builder)
        {
            builder.UseMiddleware<PluginStaticFileMiddleware>();
            return builder;
        }
        public static void UseFileLog(this ILoggerFactory loggerFactory, IHostingEnvironment env)
        {
            loggerFactory.AddProvider(new FileLoggerProvider(env));
        }
    }
}