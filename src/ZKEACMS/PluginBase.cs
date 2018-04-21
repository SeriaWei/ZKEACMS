/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Mvc.Plugin;
using Easy.Mvc.Resource;
using Easy.Mvc.Route;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Reflection;
using ZKEACMS.Widget;
using Easy.Extend;
using System.IO;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection.Extensions;
using ZKEACMS.WidgetTemplate;

namespace ZKEACMS
{
    public abstract class PluginBase : ResourceManager, IRouteRegister, IPluginStartup
    {
        public Assembly Assembly { get; set; }
        public abstract IEnumerable<RouteDescriptor> RegistRoute();
        public abstract IEnumerable<AdminMenu> AdminMenu();
        public abstract IEnumerable<PermissionDescriptor> RegistPermission();
        public abstract IEnumerable<WidgetTemplateEntity> WidgetServiceTypes();
        public abstract void ConfigureServices(IServiceCollection serviceCollection);
        public virtual void ConfigureApplication(IApplicationBuilder app, IHostingEnvironment env)
        {

        }
        public static Dictionary<Type, string> pluginPathCache = new Dictionary<Type, string>();
        public string CurrentPluginPath
        {
            get;
            set;
        }

        public static string GetPath<T>() where T : PluginBase
        {
            Type pluginType = typeof(T);
            if (pluginPathCache.ContainsKey(pluginType))
            {
                return pluginPathCache[pluginType];
            }
            return string.Empty;
        }
        public virtual void Setup(params object[] args)
        {
            var pluginType = this.GetType();
            if (!pluginPathCache.ContainsKey(pluginType))
            {
                pluginPathCache.Add(pluginType, CurrentPluginPath);
            }
            var menus = this.AdminMenu();
            if (menus != null)
            {
                AdminMenus.Menus.AddRange(menus);
            }
            this.SetupResource();
            var permissions = this.RegistPermission();
            if (permissions != null)
            {
                PermissionKeys.KnownPermissions.AddRange(permissions);
            }
            var routes = this.RegistRoute();
            if (routes != null)
            {
                RouteDescriptors.Routes.AddRange(routes);
            }
            var widgets = this.WidgetServiceTypes();
            if (widgets != null)
            {
                WidgetTemplateService.KnownWidgets.AddRange(widgets);
                foreach (var item in WidgetTemplateService.KnownWidgets)
                {
                    string name = $"{item.AssemblyName},{item.ServiceTypeName}";
                    if (!WidgetBase.KnownWidgetService.ContainsKey(name))
                    {
                        WidgetBase.KnownWidgetService.Add(name, item.ServiceType);
                    }
                    string modelName = $"{item.AssemblyName},{item.ViewModelTypeName}";
                    if (!WidgetBase.KnownWidgetModel.ContainsKey(modelName))
                    {
                        WidgetBase.KnownWidgetModel.Add(modelName, item.ViewModelType);
                    }
                }
            }
            if (args != null && args.Length > 0)
            {
                foreach (var item in args)
                {
                    IServiceCollection serviceCollection = item as IServiceCollection;
                    if (serviceCollection != null)
                    {
                        ConfigureServices(serviceCollection);
                        if (ActionDescriptorProvider.PluginControllers.ContainsKey(Assembly.FullName))
                        {
                            ActionDescriptorProvider.PluginControllers[Assembly.FullName].Each(c => serviceCollection.TryAddTransient(c.AsType()));
                        }
                    }
                }
            }

        }
    }
}
