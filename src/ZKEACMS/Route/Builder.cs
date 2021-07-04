/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */


using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.Route
{
    public static class Builder
    {
        public static void AddRouteDataProvider(this IServiceCollection services)
        {
            services.TryAddSingleton<IRouteProvider, RouteProvider>();
            services.AddTransient<IRouteDataProvider, PaginationRouteDataProvider>();
            services.AddTransient<IRouteDataProvider, PostIdRouteDataProvider>();
            services.AddTransient<IRouteDataProvider, CategoryRouteDataProvider>();
            services.AddTransient<IRouteDataProvider, HtmlRouteDataProvider>();
        }
    }
}
