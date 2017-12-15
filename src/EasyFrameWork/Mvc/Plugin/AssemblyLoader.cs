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
    public class AssemblyLoader : AssemblyLoadContext
    {
        private const string ControllerTypeNameSuffix = "Controller";
        public AssemblyLoader()
        {
        }

        public IServiceProvider ServiceProvider { get; set; }
        private Assembly CurrentAssembly;
        private List<Assembly> DependencyAssemblies = new List<Assembly>();
        private TypeInfo PluginTypeInfo = typeof(IPluginStartup).GetTypeInfo();
        public IEnumerable<Assembly> LoadPlugin(string path)
        {
            if (CurrentAssembly == null)
            {
                AssemblyLoadContext.Default.Resolving += Default_Resolving;
                var assembly = this.LoadFromAssemblyPath(path);
                CurrentAssembly = assembly;
                ResolveDenpendency();
                RegistAssembly(assembly);
                yield return assembly;
                foreach (var item in DependencyAssemblies)
                {
                    yield return item;
                }
            }
            else { throw new Exception("A loader just can load one assembly."); }
        }

        private Assembly Default_Resolving(AssemblyLoadContext arg1, AssemblyName arg2)
        {
            return Load(arg2);
        }
        private void ResolveDenpendency()
        {
            string currentName = CurrentAssembly.GetName().Name;
            var dependencyCompilationLibrary = DependencyContext.Load(CurrentAssembly)
                .CompileLibraries.Where(de => de.Name != currentName && !DependencyContext.Default.CompileLibraries.Any(m => m.Name == de.Name))
                .ToList();

            dependencyCompilationLibrary.Each(libaray =>
            {
                bool depLoaded = false;
                foreach (var assembly in libaray.Assemblies)
                {
                    var files = new DirectoryInfo(Path.GetDirectoryName(CurrentAssembly.Location)).GetFiles(Path.GetFileName(assembly));
                    foreach (var file in files)
                    {
                        DependencyAssemblies.Add(LoadFromAssemblyPath(file.FullName));
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
                            DependencyAssemblies.Add(LoadFromAssemblyPath(item));
                            break;
                        }
                    }
                }
            });


        }
        protected override Assembly Load(AssemblyName assemblyName)
        {
            if (assemblyName.FullName == CurrentAssembly.FullName)
            {
                return CurrentAssembly;
            }
            var deps = DependencyContext.Default;
            if (deps.CompileLibraries.Any(d => d.Name == assemblyName.Name))
            {
                return Assembly.Load(assemblyName);
            }

            foreach (var item in DependencyAssemblies)
            {
                if (item.FullName == assemblyName.FullName)
                {
                    return item;
                }
            }
            return null;
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
                    plugin.CurrentPluginPath = Path.GetDirectoryName(assembly.Location);
                    var binIndex = plugin.CurrentPluginPath.IndexOf($"{Path.DirectorySeparatorChar}bin{Path.DirectorySeparatorChar}");
                    if (binIndex >= 0)
                    {
                        plugin.CurrentPluginPath = plugin.CurrentPluginPath.Substring(0, binIndex);
                    }
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
