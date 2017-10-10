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
        private Assembly CurrentAssembly;
        private List<Assembly> DependencyAssemblies = new List<Assembly>();
        private List<CompilationLibrary> DependencyCompilationLibrary;
        public Action<IPluginStartup> OnLoading { get; set; }
        public Action<Assembly> OnLoaded { get; set; }
        public Func<IServiceCollection> Services { get; set; }
        public IHostingEnvironment HostingEnvironment { get; set; }
        public IEnumerable<Assembly> LoadPlugin(string path)
        {
            if (CurrentAssembly == null)
            {
                AssemblyLoadContext.Default.Resolving += Default_Resolving;
                var assembly = this.LoadFromAssemblyPath(path);
                CurrentAssembly = assembly;
                RegistAssembly(assembly);
                ResolveDenpendency();
                OnLoaded?.Invoke(assembly);
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
            var assemblies = new DirectoryInfo(new FileInfo(CurrentAssembly.Location).DirectoryName).GetFiles("*.dll");
            foreach (var item in assemblies)
            {
                if (item.FullName == CurrentAssembly.Location) continue;

                var assembly = LoadFromAssemblyPath(item.FullName);
                if (!DependencyContext.Default.CompileLibraries.Any(m => m.Name == assembly.GetName().Name))
                {
                    DependencyAssemblies.Add(assembly);
                }
            }
            string currentName = CurrentAssembly.GetName().Name;
            DependencyCompilationLibrary = DependencyContext.Load(CurrentAssembly).CompileLibraries.Where(de => de.Name != currentName && !DependencyContext.Default.CompileLibraries.Any(m => m.Name == de.Name)).ToList();
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
            if (DependencyCompilationLibrary != null)
            {
                var dep = DependencyCompilationLibrary.FirstOrDefault(m => m.Name == assemblyName.Name);
                if (dep != null)
                {
                    foreach (var item in dep.ResolveReferencePaths())
                    {
                        if (File.Exists(item))
                        {
                            return LoadFromAssemblyPath(item);
                        }
                    }
                }
            }
            return null;
        }
        private void RegistAssembly(Assembly assembly)
        {
            List<TypeInfo> controllers = new List<TypeInfo>();
            Type PluginType = typeof(IPluginStartup);
            foreach (var typeInfo in assembly.DefinedTypes)
            {
                if (typeInfo.IsAbstract || typeInfo.IsInterface) continue;

                if (IsController(typeInfo) && !controllers.Contains(typeInfo))
                {
                    controllers.Add(typeInfo);
                }
                else if (PluginType.IsAssignableFrom(typeInfo.AsType()))
                {
                    var plugin = (Activator.CreateInstance(typeInfo.AsType()) as IPluginStartup);
                    plugin.CurrentPluginPath = Path.GetDirectoryName(assembly.Location);
                    var binIndex = plugin.CurrentPluginPath.IndexOf("\\bin\\");
                    if (binIndex >= 0)
                    {
                        plugin.CurrentPluginPath = plugin.CurrentPluginPath.Substring(0, binIndex);
                    }
                    if (Services != null)
                    {
                        plugin.HostingEnvironment = HostingEnvironment;
                        plugin.ConfigureServices(Services());
                    }
                    OnLoading?.Invoke(plugin);
                }
            }
            if (controllers.Count > 0 && !ActionDescriptorProvider.PluginControllers.ContainsKey(assembly.FullName) && Services != null)
            {
                IServiceCollection services = Services();
                controllers.Each(c => services.TryAddTransient(c.AsType()));
                ActionDescriptorProvider.PluginControllers.Add(assembly.FullName, controllers);
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
