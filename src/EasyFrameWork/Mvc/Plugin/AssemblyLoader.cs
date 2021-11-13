/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Microsoft.Extensions.DependencyModel;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.Loader;
using System.Threading.Tasks;
using Easy.Extend;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Hosting;

namespace Easy.Mvc.Plugin
{
    public class AssemblyLoader
    {
        private static Dictionary<string, Assembly> LoadedAssemblies { get; set; }
        public AssemblyLoader(List<PluginInfo> plugins)
        {
            DependencyAssemblies = new List<Assembly>();
            PluginInfos = plugins ?? new List<PluginInfo>();
        }
        public string CurrentPath { get; set; }
        public string AssemblyPath { get; set; }
        public Assembly CurrentAssembly { get; private set; }
        public List<PluginInfo> PluginInfos { get; set; }
        public List<Assembly> DependencyAssemblies { get; private set; }
        private readonly TypeInfo PluginTypeInfo = typeof(IPluginStartup).GetTypeInfo();
        public IEnumerable<Assembly> LoadPlugin(string path)
        {
            if (CurrentAssembly == null)
            {
                AssemblyPath = path;
                CurrentAssembly = AssemblyLoadContext.Default.LoadFromAssemblyPath(path);
                ResolveDenpendency(CurrentAssembly);
                yield return CurrentAssembly;
                foreach (var item in DependencyAssemblies)
                {
                    yield return item;
                }
            }
            else { throw new Exception("A loader just can load one assembly."); }
        }

        private void ResolveDenpendency(Assembly assembly)
        {
            if (LoadedAssemblies == null)
            {
                LoadedAssemblies = AppDomain.CurrentDomain.GetAssemblies().ToDictionary(m => GetAssemblyNameVersion(m.GetName()));
            }
            string nameVersion = GetAssemblyNameVersion(assembly.GetName());
            if (!LoadedAssemblies.ContainsKey(nameVersion))
            {
                LoadedAssemblies.Add(nameVersion, assembly);
            }
            List<Assembly> dependencies = new List<Assembly>();
            DependencyAssemblyResolver dependencyAssemblyResolver = new DependencyAssemblyResolver(Path.GetDirectoryName(assembly.Location));
            foreach (var item in dependencyAssemblyResolver.ResolveAssemblyPaths())
            {
                AssemblyName assemblyName = AssemblyName.GetAssemblyName(item);
                string assemblyNameVersion = GetAssemblyNameVersion(assemblyName);
                if (!LoadedAssemblies.ContainsKey(assemblyNameVersion))
                {
                    Assembly assemblyDep = AssemblyLoadContext.Default.LoadFromAssemblyPath(item);
                    DependencyAssemblies.Add(assemblyDep);
                    LoadedAssemblies.Add(assemblyNameVersion, assemblyDep);
                    dependencies.Add(assemblyDep);
                }
            }

            PluginDescriptor plugin = null;
            foreach (var typeInfo in assembly.DefinedTypes)
            {
                if (typeInfo.IsAbstract || typeInfo.IsInterface) continue;

                if (PluginTypeInfo.IsAssignableFrom(typeInfo))
                {
                    plugin = new PluginDescriptor
                    {
                        PluginType = typeInfo.AsType(),
                        Assembly = assembly,
                        Dependencies = dependencies,
                        CurrentPluginPath = CurrentPath
                    };
                }
            }

            if (plugin != null)
            {
                PluginActivtor.LoadedPlugins.Add(plugin);
            }

        }
        private string GetAssemblyNameVersion(AssemblyName assemblyName)
        {
            return $"{assemblyName.Name}-{assemblyName.Version.ToString()}";
        }
    }
}
