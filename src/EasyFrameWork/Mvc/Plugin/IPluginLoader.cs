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
        void LoadEnablePlugins(Action<IPluginStartup> onLoading, Action<Assembly> onLoaded, Func<IServiceCollection> services);
        IEnumerable<PluginInfo> GetPlugins();
        void DisablePlugin(string pluginId);
        void EnablePlugin(string pluginId);
        IEnumerable<Assembly> GetPluginAssemblies();
        string PluginFolderName();
    }
}
