/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Extend;
using Easy.Serializer;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
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
        private readonly string[] AltDevelopmentPath = new[] { "bin", "Debug", "net9.0" };
#else
        private readonly string[] AltDevelopmentPath = new[] { "bin", "Release", "net9.0" };
#endif
        private readonly static List<AssemblyLoader> Loaders = new List<AssemblyLoader>();
        private readonly static Dictionary<string, Assembly> LoadedAssemblies = new Dictionary<string, Assembly>();
        private static Dictionary<string, Assembly> PluginAssemblies = new Dictionary<string, Assembly>();
        private static Dictionary<string, PluginInfo> availablePluginSet = new Dictionary<string, PluginInfo>(StringComparer.OrdinalIgnoreCase);


        public Loader(IWebHostEnvironment hostEnvironment)
        {
            HostingEnvironment = hostEnvironment;
        }
        public IWebHostEnvironment HostingEnvironment { get; set; }
        public IEnumerable<IPluginStartup> LoadEnablePlugins(IServiceCollection serviceCollection)
        {
            var start = DateTime.Now;
            List<PluginInfo> availablePlugins = GetPlugins().Where(m => m.Enable && m.ID.IsNotNullAndWhiteSpace()).ToList();
            Loaders.AddRange(availablePlugins.Select(m =>
            {
                var loader = new AssemblyLoader(availablePlugins)
                {
                    CurrentPath = m.RelativePath
                };
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
                if (!PluginAssemblies.ContainsKey(m.Name))
                {
                    PluginAssemblies.Add(m.Name, loader.CurrentAssembly);
                }

                m.Assembly = loader.CurrentAssembly;
                m.EmbeddedResource = loader.CurrentAssembly.GetManifestResourceNames().ToHashSet(StringComparer.OrdinalIgnoreCase);

                availablePluginSet[m.Name] = m;
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
                Path.Combine(new DirectoryInfo(HostingEnvironment.ContentRootPath).Parent.FullName, PluginFolder) :
                Path.Combine(HostingEnvironment.ContentRootPath, PluginFolder);

            if (Directory.Exists(modulePath))
            {
                var modules = new DirectoryInfo(modulePath).GetDirectories();
                foreach (var item in modules)
                {
                    string pluginInfo = Path.Combine(item.FullName, PluginInfoFile);
                    if (File.Exists(pluginInfo))
                    {
                        var plugin = JsonConverter.Deserialize<PluginInfo>(File.ReadAllText(pluginInfo));
                        plugin.RelativePath = item.FullName;
                        plugin.DirectoryName = item.Name;
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
                File.WriteAllText(m.RelativePath.CombinePath(PluginInfoFile), JsonConverter.Serialize(m));
            });
        }

        public void EnablePlugin(string pluginId)
        {
            GetPlugins().Where(m => m.ID == pluginId).Each(m =>
            {
                m.Enable = true;
                File.WriteAllText(m.RelativePath.CombinePath(PluginInfoFile), JsonConverter.Serialize(m));
            });
        }

        public string GetPluginFolderName()
        {
            return PluginFolder;
        }

        public PluginInfo GetLoadedPlugin(string name)
        {
            if (!availablePluginSet.ContainsKey(name)) return null;

            return availablePluginSet[name];
        }

        public IEnumerable<PluginInfo> GetLoadedPlugins()
        {
            return availablePluginSet.Values;
        }
    }

}
