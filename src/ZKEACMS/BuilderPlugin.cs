/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */


using Easy;
using Easy.Mvc.Plugin;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Widget;

namespace ZKEACMS
{
    public static class BuilderPlugin
    {
        public static void ConfigPlugin(this IServiceCollection services, IWebHostEnvironment webHostEnvironment, IMvcBuilder mvcBuilder)
        {
            foreach (IPluginStartup item in services.LoadAvailablePlugins())
            {
                item.Setup(new object[] { services, mvcBuilder, webHostEnvironment });
            }

            foreach (KeyValuePair<string, Type> item in WidgetBase.KnownWidgetService)
            {
                services.TryAddTransient(item.Value);
            }
            foreach (KeyValuePair<string, Type> item in WidgetBase.KnownWidgetModel)
            {
                services.TryAddTransient(item.Value);
            }
        }
    }
}
