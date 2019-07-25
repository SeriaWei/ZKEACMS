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
        private static bool Resolving { get; set; }
        public AssemblyLoader()
        {
            DependencyAssemblies = new List<Assembly>();
        }
        public string CurrentPath { get; set; }
        public string AssemblyPath { get; set; }
        public Assembly CurrentAssembly { get; private set; }
        public List<Assembly> DependencyAssemblies { get; private set; }
        private TypeInfo PluginTypeInfo = typeof(IPluginStartup).GetTypeInfo();
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
            List<CompilationLibrary> dependencyCompilationLibrary = DependencyContext.Load(assembly)
                .CompileLibraries.Where(de => de.Name != currentName && !DependencyContext.Default.CompileLibraries.Any(m => m.Name == de.Name))
                .ToList();

            Dictionary<string, Assembly> loadedAssembly = AppDomain.CurrentDomain.GetAssemblies().ToDictionary(m => m.GetName().Name);

            dependencyCompilationLibrary.Each(libaray =>
            {
                foreach (var item in libaray.ResolveReferencePaths(new DependencyAssemblyResolver(Path.GetDirectoryName(assembly.Location))))
                {
                    string assemblyName = AssemblyName.GetAssemblyName(item).Name;
                    if (!loadedAssembly.ContainsKey(assemblyName))
                    {
                        DependencyAssemblies.Add(AssemblyLoadContext.Default.LoadFromAssemblyPath(item));
                    }
                }
            });

            PluginDescriptor plugin = null;
            foreach (var typeInfo in assembly.DefinedTypes)
            {
                if (typeInfo.IsAbstract || typeInfo.IsInterface) continue;

                if (PluginTypeInfo.IsAssignableFrom(typeInfo))
                {
                    plugin = new PluginDescriptor();
                    plugin.PluginType = typeInfo.AsType();
                    plugin.Assembly = assembly;
                    plugin.Dependency = dependencyCompilationLibrary;
                    plugin.CurrentPluginPath = CurrentPath;
                }
            }

            if (plugin != null)
            {
                PluginActivtor.LoadedPlugins.Add(plugin);
            }

        }
    }
}
