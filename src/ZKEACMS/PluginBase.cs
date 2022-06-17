/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

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
using ZKEACMS.Route;
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
        public IWebHostEnvironment WebHostEnvironment { get; private set; }
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
        public static HashSet<string> ActiveWidgetTemplates
        {
            get;
            set;
        }
        public string CurrentPluginPath
        {
            get;
            set;
        }
        public List<Assembly> Dependencies { get; set; }
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
            if (args != null && args.Length > 0)
            {
                WebHostEnvironment = args.FirstOrDefault(m => m is IWebHostEnvironment) as IWebHostEnvironment;
            }
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
                //foreach (var item in menus)
                //{
                //    item.PluginName = this.Name;
                //    AdminMenus.Menus.Add(item);
                //}
                AdminMenus.PluginMenu.Add(menus);
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
                            Assembly.DefinedTypes.Where(type => IsController(type)).Each(c =>
                            {
                                // RouteAttribute[] controllerRoutes = c.GetCustomAttributes(typeof(RouteAttribute), false) as RouteAttribute[];
                                // if (controllerRoutes != null)
                                // {
                                //     foreach (var route in controllerRoutes)
                                //     {
                                //         RouteDescriptors.Routes.Add(new RouteDescriptor()
                                //         {
                                //             RouteName = $"ControllerRoute_{c.Name}",
                                //             Template = route.Template,
                                //             Priority = 10
                                //         });
                                //     }
                                // }
                                // MemberInfo[] actions = c.GetMethods();
                                // foreach (var action in actions)
                                // {
                                //     RouteAttribute[] actionRoutes = action.GetCustomAttributes(typeof(RouteAttribute), false) as RouteAttribute[];
                                //     if (actionRoutes != null)
                                //     {
                                //         foreach (var route in actionRoutes)
                                //         {
                                //             RouteDescriptors.Routes.Add(new RouteDescriptor()
                                //             {
                                //                 RouteName = $"ActionRoute_{c.Name}",
                                //                 Template = route.Template,
                                //                 Priority = 11
                                //             });
                                //         }
                                //     }
                                // }
                                serviceCollection.TryAddTransient(c);
                            });
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
                yield break;
            }

            yield return Assembly.Location;
            foreach (var item in Dependencies)
            {
                yield return item.Location;
            }
        }
        #region Viewfeature
        public virtual void PopulateFeature(IEnumerable<ApplicationPart> parts, ViewsFeature feature)
        {
            if (ActiveWidgetTemplates == null)
            {
                ActiveWidgetTemplates = new HashSet<string>();
                foreach (var item in feature.ViewDescriptors)
                {
                    string name = Path.GetFileName(item.RelativePath);
                    if (name.StartsWith("Widget.") && !ActiveWidgetTemplates.Contains(name))
                    {
                        ActiveWidgetTemplates.Add(name);
                    }
                }
            }
            var knownIdentifiers = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
            var attributes = new RazorCompiledItemLoader().LoadItems(Assembly);
            foreach (var item in attributes)
            {
                var descriptor = new CompiledViewDescriptor(item);
                if (knownIdentifiers.Add(descriptor.RelativePath))
                {
                    string name = Path.GetFileName(descriptor.RelativePath);
                    if (name.StartsWith("Widget.") && !ActiveWidgetTemplates.Contains(name))
                    {
                        ActiveWidgetTemplates.Add(name);
                    }

                    feature.ViewDescriptors.Add(descriptor);
                }
            }
        }
        #endregion
    }
}
