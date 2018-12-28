/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;

namespace Easy.Mvc.Plugin
{
    public interface IPluginLoader
    {
        IEnumerable<IPluginStartup> LoadEnablePlugins(IServiceCollection serviceCollection);
        IEnumerable<PluginInfo> GetPlugins();
        void DisablePlugin(string pluginId);
        void EnablePlugin(string pluginId);
        IEnumerable<Assembly> GetPluginAssemblies();
        string PluginFolderName();
    }
}
