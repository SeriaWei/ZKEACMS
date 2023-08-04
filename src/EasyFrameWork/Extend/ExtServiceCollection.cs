/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Cache;
using Easy.IoC;
using Easy.Mvc.StateProviders;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;

namespace Easy.Extend
{
    public static class ExtServiceCollection
    {
        public static IServiceCollection ConfigureStateProvider<T>(this IServiceCollection services)
            where T : class, IApplicationContextStateProvider
        {
            services.AddScoped<IApplicationContextStateProvider, T>();
            services.AddScoped<T>();
            return services;
        }

        public static void AddAssembly(this IServiceCollection services, Assembly assembly)
        {
            var allPublicType = assembly.DefinedTypes.Where(m => !m.IsAbstract && !m.IsInterface && m.IsPublic && m.IsVisible);

            foreach (var type in allPublicType)
            {
                var interfaces = type.GetInterfaces();
                if (!interfaces.Any()) continue;

                if (Dependency.Transient.IsAssignableFrom(type))
                {
                    foreach (var iType in interfaces.Where(IsNotDependencyInterface))
                    {
                        services.AddTransient(iType, type);
                    }
                }
                else if (Dependency.Scoped.IsAssignableFrom(type))
                {
                    foreach (var iType in interfaces.Where(IsNotDependencyInterface))
                    {
                        services.AddScoped(iType, type);
                    }
                }
                else if (Dependency.Singleton.IsAssignableFrom(type))
                {
                    foreach (var iType in interfaces.Where(IsNotDependencyInterface))
                    {
                        services.AddSingleton(iType, type);
                    }
                }
            }
        }
        private static bool IsNotDependencyInterface(Type type)
        {
            return type != Dependency.Transient && type != Dependency.Scoped && type != Dependency.Singleton;
        }
    }
}
