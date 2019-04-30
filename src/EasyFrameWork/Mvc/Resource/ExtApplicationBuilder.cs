/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.Mvc.Resource
{
    public static class ExtApplicationBuilder
    {
        public static void ConfigureResource(this IApplicationBuilder applicationBuilder)
        {
            foreach (var item in applicationBuilder.ApplicationServices.GetServices<ResourceManager>())
            {
                item.SetupResource();
            }
        }
    }
}
