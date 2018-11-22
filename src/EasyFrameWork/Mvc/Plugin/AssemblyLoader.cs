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
        private const string ControllerTypeNameSuffix = "Controller";
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
                RegistAssembly(CurrentAssembly);
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
            var dependencyCompilationLibrary = DependencyContext.Load(assembly)
                .CompileLibraries.Where(de => de.Name != currentName && !DependencyContext.Default.CompileLibraries.Any(m => m.Name == de.Name))
                .ToList();

            dependencyCompilationLibrary.Each(libaray =>
            {
                bool depLoaded = false;
                foreach (var item in libaray.Assemblies)
                {
                    var files = new DirectoryInfo(Path.GetDirectoryName(assembly.Location)).GetFiles(Path.GetFileName(item));
                    foreach (var file in files)
                    {
                        DependencyAssemblies.Add(AssemblyLoadContext.Default.LoadFromAssemblyPath(file.FullName));
                        depLoaded = true;
                        break;
                    }
                }
                if (!depLoaded)
                {
                    foreach (var item in libaray.ResolveReferencePaths())
                    {
                        if (File.Exists(item))
                        {
                            DependencyAssemblies.Add(AssemblyLoadContext.Default.LoadFromAssemblyPath(item));
                            break;
                        }
                    }
                }
            });


        }

        private void RegistAssembly(Assembly assembly)
        {
            List<TypeInfo> controllers = new List<TypeInfo>();
            PluginDescriptor plugin = null;
            foreach (var typeInfo in assembly.DefinedTypes)
            {
                if (typeInfo.IsAbstract || typeInfo.IsInterface) continue;

                if (IsController(typeInfo) && !controllers.Contains(typeInfo))
                {
                    controllers.Add(typeInfo);
                }
                else if (PluginTypeInfo.IsAssignableFrom(typeInfo))
                {
                    plugin = new PluginDescriptor();
                    plugin.PluginType = typeInfo.AsType();
                    plugin.Assembly = assembly;
                    plugin.CurrentPluginPath = CurrentPath;
                }
            }
            if (controllers.Count > 0 && !ActionDescriptorProvider.PluginControllers.ContainsKey(assembly.FullName))
            {
                ActionDescriptorProvider.PluginControllers.Add(assembly.FullName, controllers);
            }
            if (plugin != null)
            {
                PluginActivtor.LoadedPlugins.Add(plugin);
            }
        }
        protected bool IsController(TypeInfo typeInfo)
        {
            if (!typeInfo.IsClass)
            {
                return false;
            }

            if (typeInfo.IsAbstract)
            {
                return false;
            }


            if (!typeInfo.IsPublic)
            {
                return false;
            }

            if (typeInfo.ContainsGenericParameters)
            {
                return false;
            }

            if (typeInfo.IsDefined(typeof(NonControllerAttribute)))
            {
                return false;
            }

            if (!typeInfo.Name.EndsWith(ControllerTypeNameSuffix, StringComparison.OrdinalIgnoreCase) &&
                !typeInfo.IsDefined(typeof(ControllerAttribute)))
            {
                return false;
            }

            return true;
        }
    }
}
