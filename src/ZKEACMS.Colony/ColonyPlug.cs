/* http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses 
 */
using Easy.Mvc.Resource;
using Easy.Mvc.Route;
using System;
using System.Collections.Generic;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Easy.RepositoryPattern;

namespace ZKEACMS.Colony
{
    public class ColonyPlug : PluginBase
    {
        public override IEnumerable<RouteDescriptor> RegistRoute()
        {
            return null;
        }

        public override IEnumerable<AdminMenu> AdminMenu()
        {
            return null;
        }

        protected override void InitScript(Func<string, ResourceHelper> script)
        {

        }

        protected override void InitStyle(Func<string, ResourceHelper> style)
        {
           
        }

        public override IEnumerable<PermissionDescriptor> RegistPermission()
        {
            return null;
        }

        public override IEnumerable<Type> WidgetServiceTypes()
        {
            return null;
        }

        public override void ConfigureServices(IServiceCollection serviceCollection)
        {
            serviceCollection.Replace(new ServiceDescriptor(typeof(IOnConfiguring), typeof(EntityFrameWorkConfigure), ServiceLifetime.Transient));
        }
    }
}