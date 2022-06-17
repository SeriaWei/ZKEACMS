/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */


using Easy.Extend;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Common.Models;
using ZKEACMS.Layout;
using ZKEACMS.Theme;
using ZKEACMS.Widget;
using ZKEACMS.Zone;

namespace ZKEACMS
{
    public static class BuilderCache
    {
        public static void ConfigCache(this IServiceCollection services)
        {
            services.ConfigureCache<IEnumerable<WidgetBase>>();
            services.ConfigureCache<IEnumerable<ZoneEntity>>();
            services.ConfigureCache<IEnumerable<LayoutHtml>>();
            services.ConfigureCache<IEnumerable<ThemeEntity>>();
            services.ConfigureCache<List<TemplateFile>>();
            services.ConfigureCache<ConcurrentDictionary<string, object>>();
            services.ConfigureCache<string>();
        }
    }
}
