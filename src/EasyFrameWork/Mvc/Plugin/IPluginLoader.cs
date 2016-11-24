using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Easy.Mvc.Plugin
{
    public interface IPluginLoader
    {
        void LoadEnablePlugins(Action<IPluginStartup> onLoading);
        IEnumerable<PluginInfo> GetPlugins();
        void DisablePlugin(string pluginId);
        void EnablePlugin(string pluginId);
    }
}
