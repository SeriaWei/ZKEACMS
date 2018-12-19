/* http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses 
 *
 */
using Easy.Mvc.Resource;
using Easy.Mvc.Route;
using System;
using System.Collections.Generic;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Easy.RepositoryPattern;
using Easy;
using ZKEACMS.WidgetTemplate;
using ZKEACMS.SiteSearch.Service;
using ZKEACMS.SiteSearch.Models;
using Microsoft.Extensions.Configuration;

namespace ZKEACMS.SiteSearch
{
    public class SiteSearchPlug : PluginBase
    {
        public override IEnumerable<RouteDescriptor> RegistRoute()
        {
            return null;
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
            yield return new WidgetTemplateEntity<SiteSearchWidgetService>
            {
                Title = "站点搜索",
                GroupName = "6.搜索",
                PartialView = "Widget.SiteSearch",
                Thumbnail = "~/Plugins/ZKEACMS.SiteSearch/Content/Widget.SiteSearch.png",
                Order = 1
            };
        }

        public override void ConfigureServices(IServiceCollection serviceCollection)
        {
            var configuration = new ConfigurationBuilder()
                .SetBasePath(CurrentPluginPath)
                .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true).Build();

            serviceCollection.AddSingleton(configuration.GetSection("SearchEngines").Get<IEnumerable<SearchEngine>>());
            serviceCollection.ConfigureMetaData<SiteSearchWidget, SiteSearchWidgetMetaData>();
        }
    }
}