/* http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy.Extend;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;

namespace Easy.Mvc.Plugin
{
    public class Loader : IPluginLoader
    {
        public const string PluginFolder = "Plugins";
        private const string PluginInfoFile = "zkea.plugin";
#if DEBUG
        private string[] AltDevelopmentPath = new[] { "bin", "Debug", "netcoreapp3.0" };
#else
        private string[] AltDevelopmentPath = new[] { "bin", "Release", "netcoreapp3.0" };
#endif
        private static List<AssemblyLoader> Loaders = new List<AssemblyLoader>();
        private static Dictionary<string, Assembly> LoadedAssemblies = new Dictionary<string, Assembly>();
        public Loader(IWebHostEnvironment hostEnvironment)
        {
            HostingEnvironment = hostEnvironment;
        }
        public IWebHostEnvironment HostingEnvironment { get; set; }
        public IEnumerable<IPluginStartup> LoadEnablePlugins(IServiceCollection serviceCollection)
        {
            var start = DateTime.Now;
            Loaders.AddRange(GetPlugins().Where(m => m.Enable && m.ID.IsNotNullAndWhiteSpace()).Select(m =>
            {
                var loader = new AssemblyLoader();
                loader.CurrentPath = m.RelativePath;
                var assemblyPath = Path.Combine(m.RelativePath, (HostingEnvironment.IsDevelopment() ? Path.Combine(AltDevelopmentPath) : string.Empty), m.FileName);

                Console.WriteLine("Loading: {0}", m.Name);

                var assemblies = loader.LoadPlugin(assemblyPath);
                assemblies.Each(assembly =>
                {
                    if (!LoadedAssemblies.ContainsKey(assembly.FullName))
                    {
                        LoadedAssemblies.Add(assembly.FullName, assembly);
                    }
                });
                return loader;
            }));
            Console.WriteLine("All plugins are loaded. Elapsed: {0}ms", (DateTime.Now - start).Milliseconds);
            return serviceCollection.ConfigurePlugin().BuildServiceProvider().GetPlugins();
        }

        public IEnumerable<Assembly> GetPluginAssemblies()
        {
            return LoadedAssemblies.Select(m => m.Value);
        }
        public IEnumerable<PluginInfo> GetPlugins()
        {
            string modulePath = HostingEnvironment.IsDevelopment() ?
                new DirectoryInfo(HostingEnvironment.ContentRootPath).Parent.FullName :
                Path.Combine(HostingEnvironment.WebRootPath, PluginFolder);

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
                File.WriteAllText(m.RelativePath.CombinePath(PluginInfoFile), JsonConvert.SerializeObject(m));
            });
        }

        public void EnablePlugin(string pluginId)
        {
            GetPlugins().Where(m => m.ID == pluginId).Each(m =>
            {
                m.Enable = true;
                File.WriteAllText(m.RelativePath.CombinePath(PluginInfoFile), JsonConvert.SerializeObject(m));
            });
        }

        public string PluginFolderName()
        {
            return PluginFolder;
        }
    }

}
