/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */
using Easy.Cache;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.Extend
{
    public static class ExtServiceCollection
    {
        public static IServiceCollection ConfigureCache<T>(this IServiceCollection services)
        {
           return services.AddScoped(serviceProvider => serviceProvider.GetService<ICacheProvider>().Build<T>());
        }
    }
}
