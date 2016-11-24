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
        public static List<string> Folders { get; } = new List<string>();
        private static List<string> LoadedAssemblys { get; } = new List<string>();
        private static Type PluginType = typeof(IPluginStartup);
        public Action<IPluginStartup> OnLoading { get; set; }
        public Assembly LoadPlugin(string path)
        {
            if (!LoadedAssemblys.Contains(path))
            {
                var assembly = this.LoadFromAssemblyPath(path);
                var directory = new FileInfo(path).DirectoryName;
                if (!Folders.Contains(directory))
                {
                    Folders.Add(directory);
                }
                RegistAssembly(assembly);
                return assembly;
            }
            return null;
        }
        protected override Assembly Load(AssemblyName assemblyName)
        {
            string assemblyFile = assemblyName.Name + ".dll";
            foreach (var item in Folders)
            {
                string file = item + "\\" + assemblyFile;
                if (File.Exists(file))
                {
                    var assembly = this.LoadFromAssemblyPath(file);
                    if (assembly.GetName().FullName == assemblyName.FullName)
                    {
                        RegistAssembly(assembly);
                        return assembly;
                    }
                }
            }
            return null;
        }
        private void RegistAssembly(Assembly assembly)
        {
            List<TypeInfo> controllers = new List<TypeInfo>();
            assembly.DefinedTypes.Each(typeInfo =>
            {
                if (IsController(typeInfo) && !controllers.Contains(typeInfo))
                {
                    controllers.Add(typeInfo);
                }
                else if (!typeInfo.IsAbstract && !typeInfo.IsInterface)
                {
                    var type = typeInfo.AsType();
                    if (PluginType.IsAssignableFrom(type))
                    {
                        var plugin = (Activator.CreateInstance(type) as IPluginStartup);
                        plugin.ConfigureServices(Builder.ServiceCollection);
                        OnLoading?.Invoke(plugin);
                    }
                }
            });
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
