/* http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses 
 *
 */
using Easy.Mvc.Resource;
using Easy.Mvc.Route;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using ZKEACMS.Sitemap.Service;
using ZKEACMS.Sitemap.Service.SiteUrlProviders;
using ZKEACMS.WidgetTemplate;

namespace ZKEACMS.Sitemap
{
    public class SitemapPlug : PluginBase
    {
        public override IEnumerable<RouteDescriptor> RegistRoute()
        {
            yield return new RouteDescriptor
            {
                RouteName = "Sitemap",
                Template = "sitemap.xml",
                Defaults = new { controller = "sitemap", action = "index" },
                Priority = 11
            };
            yield return new RouteDescriptor
            {
                RouteName = "Robots",
                Template = "robots.txt",
                Defaults = new { controller = "robots", action = "index" },
                Priority = 11
            };
        }

        public override IEnumerable<AdminMenu> AdminMenu()
        {
            return null;
        }

        protected override void InitScript(Func<string, ResourceHelper> script)
        {

        }

        protected override void InitStyle(Func<string, ResourceHelper> style)
        {

        }

        public override IEnumerable<PermissionDescriptor> RegistPermission()
        {
            return null;
        }

        public override IEnumerable<WidgetTemplateEntity> WidgetServiceTypes()
        {
            return null;
        }

        public override void ConfigureServices(IServiceCollection serviceCollection)
        {
            serviceCollection.AddDbContextOptions<SitemapDbContext>();
            serviceCollection.AddDbContext<SitemapDbContext>();
            serviceCollection.AddTransient<ISitemapService, SitemapService>();
            serviceCollection.AddTransient<ISiteUrlProvider, PageSiteUrlProvider>();
            serviceCollection.AddTransient<ISiteUrlProvider, ProductPageSiteUrlProvider>();
            serviceCollection.AddTransient<ISiteUrlProvider, ArticlePageSiteUrlProvider>();
        }
    }
}