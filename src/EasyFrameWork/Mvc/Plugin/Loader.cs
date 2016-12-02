using Easy.Extend;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyModel;
using Microsoft.AspNetCore.Hosting;
using System.IO;
using Newtonsoft.Json;

namespace Easy.Mvc.Plugin
{
    public class Loader : IPluginLoader
    {
        public const string PluginFolder = "Plugins";
        private const string PluginInfoFile = ".info";
        public static IHostingEnvironment HostingEnvironment { get; set; }
        private static List<AssemblyLoader> Loaders = new List<AssemblyLoader>();
        private static Dictionary<string, Assembly> LoadedAssemblies = new Dictionary<string, Assembly>();
        public void LoadEnablePlugins(Action<IPluginStartup> onLoading, Action<Assembly> onLoaded)
        {
            GetPlugins().Where(m => m.Enable && m.ID.IsNotNullAndWhiteSpace()).Each(m =>
            {
                var loader = new AssemblyLoader();
                loader.OnLoading = onLoading;
                loader.OnLoaded = onLoaded;
                var assemblies = loader.LoadPlugin(Path.Combine(m.RelativePath, HostingEnvironment.IsDevelopment() ? m.DeveloperFileName : m.FileName));
                assemblies.Each(assembly =>
                {
                    LoadedAssemblies.Add(assembly.FullName, assembly);

                });
                
                Loaders.Add(loader);
            });
        }        

        public IEnumerable<Assembly> GetPluginAssemblies()
        {
            return LoadedAssemblies.Select(m => m.Value);
        }
        public IEnumerable<PluginInfo> GetPlugins()
        {
            string modulePath = HostingEnvironment.IsDevelopment() ?
                new DirectoryInfo(HostingEnvironment.ContentRootPath).Parent.FullName :
                Path.Combine(HostingEnvironment.ContentRootPath, PluginFolder);

            if (Directory.Exists(modulePath))
            {
                var modules = new DirectoryInfo(modulePath).GetDirectories();
                foreach (var item in modules)
                {
                    string pluginInfo = Path.Combine(item.FullName, PluginInfoFile);
                    if (File.Exists(pluginInfo))
                    {
                        var plugin = JsonConvert.DeserializeObject<PluginInfo>(File.ReadAllText(pluginInfo));
                        plugin.RelativePath = item.FullName;
                        yield return plugin;
                    }
                }
            }

        }

        public void DisablePlugin(string pluginId)
        {
            GetPlugins().Where(m => m.ID == pluginId).Each(m =>
            {
                m.Enable = false;
                File.WriteAllText(m.RelativePath + $"\\{PluginInfoFile}", JsonConvert.SerializeObject(m));
            });
        }

        public void EnablePlugin(string pluginId)
        {
            GetPlugins().Where(m => m.ID == pluginId).Each(m =>
            {
                m.Enable = true;
                File.WriteAllText(m.RelativePath + $"\\{PluginInfoFile}", JsonConvert.SerializeObject(m));
            });
        }

    }

}
