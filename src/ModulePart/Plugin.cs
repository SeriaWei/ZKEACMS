using Easy.Mvc.Resource;
using Easy.Mvc.Route;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using ZKEACMS;
using ZKEACMS.Common.Models;

namespace ModulePart
{
    public class Plugin : PluginBase
    {
        public override IEnumerable<AdminMenu> AdminMenu()
        {
            return null;
        }

        public override void ConfigureServices(IServiceCollection serviceCollection)
        {
        }

        public override IEnumerable<PermissionDescriptor> RegistPermission()
        {
            return null;
        }

        public override IEnumerable<RouteDescriptor> RegistRoute()
        {
            return null;
        }

        public override IEnumerable<Type> WidgetServiceTypes()
        {
            yield return typeof(Widget.TestWidgetService);
        }

        protected override void InitScript(Func<string, ResourceHelper> script)
        {
        }

        protected override void InitStyle(Func<string, ResourceHelper> style)
        {
        }
    }
}
