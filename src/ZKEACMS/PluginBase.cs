/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Mvc.Plugin;
using Easy.Mvc.Resource;
using Easy.Mvc.Route;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Reflection;
using ZKEACMS.Widget;

namespace ZKEACMS
{
    public abstract class PluginBase : ResourceManager, IRouteRegister, IPluginStartup
    {
        public abstract IEnumerable<RouteDescriptor> RegistRoute();
        public abstract IEnumerable<AdminMenu> AdminMenu();
        public abstract IEnumerable<PermissionDescriptor> RegistPermission();
        public abstract IEnumerable<Type> WidgetServiceTypes();
        public abstract void ConfigureServices(IServiceCollection serviceCollection);

        public virtual void InitPlug()
        {
            var menus = this.AdminMenu();
            if (menus != null)
            {
                AdminMenus.Menus.AddRange(menus);
            }
            this.Excute();
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
                foreach (var item in widgets)
                {
                    string name = $"{item.GetTypeInfo().Assembly.GetName().Name},{item.FullName}";
                    if (!WidgetBase.KnownWidgetService.ContainsKey(name))
                    {
                        
                        WidgetBase.KnownWidgetService.Add(name, item);
                    }
                    foreach (var widgetModel in item.GetTypeInfo().BaseType.GetGenericArguments())
                    {
                        string modelName = $"{widgetModel.GetTypeInfo().Assembly.GetName().Name},{widgetModel.FullName}";
                        if (!WidgetBase.KnownWidgetModel.ContainsKey(modelName))
                        {
                            WidgetBase.KnownWidgetModel.Add(modelName, widgetModel);
                        }
                    }
                }
            }
        }
    }
}
