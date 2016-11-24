/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Mvc.Plugin;
using Easy.Mvc.Resource;
using Easy.Mvc.Route;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using ZKEACMS.Common.Models;

namespace ZKEACMS
{
    public abstract class PluginBase : ResourceManager, IRouteRegister, IPluginStartup
    {
        public abstract IEnumerable<RouteDescriptor> RegistRoute();
        public abstract IEnumerable<AdminMenu> AdminMenu();
        public abstract IEnumerable<PermissionDescriptor> RegistPermission();
        public abstract IEnumerable<Type> WidgetServiceTypes();
        public abstract void ConfigureServices(IServiceCollection serviceCollection);
    }
}
