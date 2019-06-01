/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.Mvc.Plugin
{
    public static class PluginActivtor
    {
        public static List<PluginDescriptor> LoadedPlugins { get; set; } = new List<PluginDescriptor>();
        public static IServiceCollection ConfigurePlugin(this IServiceCollection serviceCollection)
        {
            var pluginType = typeof(IPluginStartup);
            foreach (var item in LoadedPlugins)
            {
                serviceCollection.AddTransient(pluginType, item.PluginType);
                serviceCollection.AddTransient(item.PluginType);
            }
            return serviceCollection;
        }
        public static IApplicationBuilder ConfigurePlugin(this IApplicationBuilder applicationBuilder, IWebHostEnvironment hostingEnvironment)
        {
            foreach (var item in applicationBuilder.ApplicationServices.GetPlugins())
            {
                item.ConfigureApplication(applicationBuilder, hostingEnvironment);
            }
            return applicationBuilder;
        }
        public static IEnumerable<IPluginStartup> GetPlugins(this IServiceProvider serviceProvider)
        {
            foreach (var item in LoadedPlugins)
            {
                var plugin = ActivatorUtilities.GetServiceOrCreateInstance(serviceProvider, item.PluginType) as IPluginStartup;
                plugin.Assembly = item.Assembly;
                plugin.Dependency = item.Dependency;
                plugin.CurrentPluginPath = item.CurrentPluginPath;
                yield return plugin;
            }
        }
    }
}
