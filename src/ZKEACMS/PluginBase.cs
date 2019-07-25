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
using Microsoft.AspNetCore.Mvc.Razor.Compilation;
using Microsoft.AspNetCore.Razor.Hosting;
using Microsoft.Extensions.Primitives;

namespace ZKEACMS
{
    public abstract class PluginBase : ResourceManager,
        IRouteRegister,
        IPluginStartup,
        IApplicationPartTypeProvider,
        ICompilationReferencesProvider,
        IApplicationFeatureProvider<ViewsFeature>
    {
        private const string ControllerTypeNameSuffix = "Controller";
        public Assembly Assembly { get; set; }

        public abstract IEnumerable<RouteDescriptor> RegistRoute();
        public abstract IEnumerable<AdminMenu> AdminMenu();
        public abstract IEnumerable<PermissionDescriptor> RegistPermission();
        public abstract IEnumerable<WidgetTemplateEntity> WidgetServiceTypes();
        public abstract void ConfigureServices(IServiceCollection serviceCollection);
        public virtual void ConfigureApplication(IApplicationBuilder app, IWebHostEnvironment env)
        {

        }
        public virtual void ConfigureMVC(IMvcBuilder mvcBuilder)
        {
            mvcBuilder.ConfigureApplicationPartManager(manguage =>
            {
                manguage.FeatureProviders.Add(this);
                manguage.ApplicationParts.Add(this);
            });
        }
        static Dictionary<Type, string> pluginPathCache = new Dictionary<Type, string>();
        static Dictionary<Type, string> pluginNameCache = new Dictionary<Type, string>();
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
        public static string GetName<T>() where T : PluginBase
        {
            Type pluginType = typeof(T);
            if (pluginNameCache.ContainsKey(pluginType))
            {
                return pluginNameCache[pluginType];
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
            if (!pluginNameCache.ContainsKey(pluginType))
            {
                pluginNameCache.Add(pluginType, this.Name);
            }
            var menus = this.AdminMenu();
            if (menus != null)
            {
                foreach (var item in menus)
                {
                    item.PluginName = this.Name;
                    AdminMenus.Menus.Add(item);
                }

            }
            this.SetupResource();
            var permissions = this.RegistPermission();
            if (permissions != null)
            {
                foreach (var item in permissions)
                {
                    item.PluginName = this.Name;
                    PermissionKeys.KnownPermissions.Add(item);
                }
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
                    item.PluginName = this.Name;
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
                        ConfigureMVC(item as IMvcBuilder);
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
        #region Viewfeature
        public virtual void PopulateFeature(IEnumerable<ApplicationPart> parts, ViewsFeature feature)
        {
            var knownIdentifiers = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
            var attributes = GetViewAttributesLegacy(Assembly);
            foreach (var item in attributes)
            {
                var descriptor = new CompiledViewDescriptor(item);
                if (knownIdentifiers.Add(descriptor.RelativePath))
                {
                    feature.ViewDescriptors.Add(descriptor);
                }
            }
        }


        protected virtual IEnumerable<RazorCompiledItem> GetViewAttributesLegacy(Assembly assembly)
        {
            if (assembly == null)
            {
                throw new ArgumentNullException(nameof(assembly));
            }

            var featureAssembly = GetViewAssembly(assembly);
            if (featureAssembly != null)
            {
                return new RazorCompiledItemLoader().LoadItems(featureAssembly);
            }

            return Enumerable.Empty<RazorCompiledItem>();
        }

        protected virtual Assembly GetViewAssembly(Assembly assembly)
        {
            if (assembly.IsDynamic || string.IsNullOrEmpty(assembly.Location))
            {
                return null;
            }
            string[] viewAssemblySuffixes = new string[] { ".Views", ".PrecompiledViews" };
            for (var i = 0; i < viewAssemblySuffixes.Length; i++)
            {
                var fileName = $"{assembly.GetName().Name}{viewAssemblySuffixes[i]}.dll";
                var filePath = Path.Combine(Path.GetDirectoryName(assembly.Location), fileName);

                if (File.Exists(filePath))
                {
                    return Assembly.LoadFile(filePath);
                }
            }

            return null;
        }
        #endregion
    }
}
