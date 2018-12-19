/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Mvc.Plugin;
using Easy.Mvc.Resource;
using Easy.Mvc.Route;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Reflection;
using ZKEACMS.Widget;
using Easy.Extend;
using System.IO;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection.Extensions;
using ZKEACMS.WidgetTemplate;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyModel;
using Microsoft.AspNetCore.Mvc.ApplicationParts;

namespace ZKEACMS
{
    public abstract class PluginBase : ResourceManager, IRouteRegister, IPluginStartup, IApplicationPartTypeProvider, ICompilationReferencesProvider
    {
        private const string ControllerTypeNameSuffix = "Controller";
        public Assembly Assembly { get; set; }

        public abstract IEnumerable<RouteDescriptor> RegistRoute();
        public abstract IEnumerable<AdminMenu> AdminMenu();
        public abstract IEnumerable<PermissionDescriptor> RegistPermission();
        public abstract IEnumerable<WidgetTemplateEntity> WidgetServiceTypes();
        public abstract void ConfigureServices(IServiceCollection serviceCollection);
        public virtual void ConfigureApplication(IApplicationBuilder app, IHostingEnvironment env)
        {

        }
        public static Dictionary<Type, string> pluginPathCache = new Dictionary<Type, string>();
        public string CurrentPluginPath
        {
            get;
            set;
        }
        public List<CompilationLibrary> Dependency { get; set; }
        public IEnumerable<TypeInfo> Types => Assembly.DefinedTypes;
        public override string Name => Assembly.GetName().Name;

        public static string GetPath<T>() where T : PluginBase
        {
            Type pluginType = typeof(T);
            if (pluginPathCache.ContainsKey(pluginType))
            {
                return pluginPathCache[pluginType];
            }
            return string.Empty;
        }
        public virtual void Setup(params object[] args)
        {
            var pluginType = this.GetType();
            if (!pluginPathCache.ContainsKey(pluginType))
            {
                pluginPathCache.Add(pluginType, CurrentPluginPath);
            }
            var menus = this.AdminMenu();
            if (menus != null)
            {
                AdminMenus.Menus.AddRange(menus);
            }
            this.SetupResource();
            var permissions = this.RegistPermission();
            if (permissions != null)
            {
                PermissionKeys.KnownPermissions.AddRange(permissions);
            }
            var routes = this.RegistRoute();
            if (routes != null)
            {
                RouteDescriptors.Routes.AddRange(routes);
            }
            var widgets = this.WidgetServiceTypes();
            if (widgets != null)
            {
                WidgetTemplateService.KnownWidgets.AddRange(widgets);
                foreach (var item in WidgetTemplateService.KnownWidgets)
                {
                    string name = $"{item.AssemblyName},{item.ServiceTypeName}";
                    if (!WidgetBase.KnownWidgetService.ContainsKey(name))
                    {
                        WidgetBase.KnownWidgetService.Add(name, item.ServiceType);
                    }
                    string modelName = $"{item.AssemblyName},{item.ViewModelTypeName}";
                    if (!WidgetBase.KnownWidgetModel.ContainsKey(modelName))
                    {
                        WidgetBase.KnownWidgetModel.Add(modelName, item.ViewModelType);
                    }
                }
            }
            if (args != null && args.Length > 0)
            {
                foreach (var item in args)
                {
                    if (item is IServiceCollection)
                    {
                        IServiceCollection serviceCollection = item as IServiceCollection;
                        if (serviceCollection != null)
                        {
                            ConfigureServices(serviceCollection);
                            Assembly.DefinedTypes.Where(type => IsController(type)).Each(c => serviceCollection.TryAddTransient(c));
                        }
                    }
                    else if (item is IMvcBuilder)
                    {
                        (item as IMvcBuilder).ConfigureApplicationPartManager(manguage => manguage.ApplicationParts.Add(this));
                    }
                }
            }

        }
        public virtual bool IsController(TypeInfo typeInfo)
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

        public IEnumerable<string> GetReferencePaths()
        {
            if (Assembly.IsDynamic)
            {
                return Enumerable.Empty<string>();
            }

            if (Dependency.Count > 0)
            {
                return Dependency.SelectMany(library => library.ResolveReferencePaths(new DependencyAssemblyResolver(Path.GetDirectoryName(Assembly.Location))))
                    .Concat(new[] { Assembly.Location });
            }

            return new[] { Assembly.Location };
        }
    }
}
