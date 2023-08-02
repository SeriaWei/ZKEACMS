/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Cache;
using Easy.Mvc.StateProviders;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
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
    }
}
