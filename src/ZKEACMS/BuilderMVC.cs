/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */


using Easy;
using Easy.Mvc.DataAnnotations;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.ModelBinder;
using ZKEACMS.Theme;

namespace ZKEACMS
{
  public static  class BuilderMVC
    {
        public static IMvcBuilder ConfigMVC(this IServiceCollection services)
        {

            //添加session
            services.AddDistributedMemoryCache();
            services.AddSession(opt =>
            {
                opt.IdleTimeout = TimeSpan.FromMinutes(20);
                //opt.Cookie.Expiration = TimeSpan.FromMinutes(30);
                //opt.Cookie.MaxAge 
                opt.Cookie.HttpOnly = true;
                opt.Cookie.IsEssential = true;
            });

            IMvcBuilder mvcBuilder = services.AddControllersWithViews(option =>
            {
                option.ModelBinderProviders.Insert(0, new WidgetTypeModelBinderProvider());
                option.ModelMetadataDetailsProviders.Add(new DataAnnotationsMetadataProvider());
            })
            .AddRazorOptions(opt =>
            {
                opt.ViewLocationExpanders.Clear();
                opt.ViewLocationExpanders.Add(new ThemeViewLocationExpander());
            })
            .AddControllersAsServices()
            .AddDataAnnotationsLocalization(option => option.DataAnnotationLocalizerProvider = (t, factory) =>
            {
                if (t.IsClass)
                {
                    return new LocalizeString(t);
                }
                else
                {
                    return null;
                }
            });

            services.AddRazorPages();
            services.AddHealthChecks();
            services.TryAddSingleton<IHttpContextAccessor, HttpContextAccessor>();

            services.AddRouting(option => option.LowercaseUrls = true);

            services.TryAddScoped<IApplicationContextAccessor, ApplicationContextAccessor>();
            services.TryAddScoped<IApplicationContext, CMSApplicationContext>();

            return mvcBuilder;
        }
    }
}
