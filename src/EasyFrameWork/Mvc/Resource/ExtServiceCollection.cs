using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.Mvc.Resource
{
    public static class ExtServiceCollection
    {
        public static void ConfigureResource<T>(this IServiceCollection serviceCollection) where T : ResourceManager
        {
            serviceCollection.AddTransient<ResourceManager, T>();
        }
    }
}
