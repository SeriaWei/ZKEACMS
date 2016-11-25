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

namespace Easy.Mvc.Plugin
{
    public class AssemblyLoader : AssemblyLoadContext
    {
        private const string ControllerTypeNameSuffix = "Controller";
        private string LoadedAssembly;

        public Action<IPluginStartup> OnLoading { get; set; }
        public Assembly LoadPlugin(string path)
        {
            if (LoadedAssembly == null)
            {
                LoadedAssembly = path;
                var assembly = this.LoadFromAssemblyPath(path);
                RegistAssembly(assembly);
                return assembly;
            }
            throw new Exception("A loader just can load one assembly.");
        }
        protected override Assembly Load(AssemblyName assemblyName)
        {
            var deps = DependencyContext.Default;
            if (deps.CompileLibraries.Any(d => d.Name == assemblyName.Name))
            {
                return Assembly.Load(assemblyName);
            }

            string file = new FileInfo(LoadedAssembly).DirectoryName + "\\" + assemblyName.Name + ".dll";
            if (File.Exists(file))
            {
                var assembly = this.LoadFromAssemblyPath(file);
                if (assembly.GetName().FullName == assemblyName.FullName)
                {
                    return assembly;
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
                    plugin.ConfigureServices(Builder.ServiceCollection);
                    OnLoading?.Invoke(plugin);
                }
            }
            if (controllers.Count > 0 && !ActionDescriptorProvider.PluginControllers.ContainsKey(assembly.FullName))
            {
                controllers.Each(c => Builder.ServiceCollection.TryAddTransient(c.AsType()));
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
