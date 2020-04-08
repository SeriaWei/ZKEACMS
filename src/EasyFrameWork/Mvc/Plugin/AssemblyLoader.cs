/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
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
        private static HashSet<string> CompileLibraries { get; set; }
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
                //AssemblyLoadContext.Default.Resolving += AssemblyResolving;
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

        //private Assembly AssemblyResolving(AssemblyLoadContext arg1, AssemblyName arg2)
        //{
        //    if (arg2.FullName == CurrentAssembly.FullName)
        //    {
        //        return CurrentAssembly;
        //    }
        //    var deps = DependencyContext.Default;
        //    if (deps.CompileLibraries.Any(d => d.Name == arg2.Name))
        //    {
        //        return Assembly.Load(arg2);
        //    }

        //    foreach (var item in DependencyAssemblies)
        //    {
        //        if (item.FullName == arg2.FullName)
        //        {
        //            return item;
        //        }
        //    }
        //    return null;
        //}
        private void ResolveDenpendency(Assembly assembly)
        {
            string currentName = assembly.GetName().Name;
            if (CompileLibraries == null)
            {
                CompileLibraries = new HashSet<string>();
                foreach (var item in DependencyContext.Default.CompileLibraries)
                {
                    if (!CompileLibraries.Contains(item.Name))
                    {
                        CompileLibraries.Add(item.Name);
                    }
                }
            }
            List<CompilationLibrary> dependencyCompilationLibrary = DependencyContext.Load(assembly)
                .CompileLibraries.Where(de => PluginInfos.All(m => m.Name != de.Name) && de.Name != currentName && !CompileLibraries.Contains(de.Name))
                .ToList();

            if (LoadedAssemblies == null)
            {
                LoadedAssemblies = AppDomain.CurrentDomain.GetAssemblies().ToDictionary(m => m.GetName().Name);
            }

            dependencyCompilationLibrary.Each(libaray =>
            {
                foreach (var item in libaray.ResolveReferencePaths(new DependencyAssemblyResolver(Path.GetDirectoryName(assembly.Location))))
                {
                    string assemblyName = AssemblyName.GetAssemblyName(item).Name;
                    if (!LoadedAssemblies.ContainsKey(assemblyName))
                    {
                        Assembly assemblyDep = AssemblyLoadContext.Default.LoadFromAssemblyPath(item);
                        DependencyAssemblies.Add(assemblyDep);
                        LoadedAssemblies.Add(assemblyName, assemblyDep);
                    }
                }
            });

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
                        Dependency = dependencyCompilationLibrary,
                        CurrentPluginPath = CurrentPath
                    };
                }
            }

            if (plugin != null)
            {
                PluginActivtor.LoadedPlugins.Add(plugin);
            }

        }
    }
}
