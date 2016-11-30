/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Mvc.Resource;
using Easy.Mvc.Route;
using System;
using System.Collections.Generic;
using ZKEACMS;
using ZKEACMS.Common.Models;
using Microsoft.Extensions.DependencyInjection;

namespace ZKEACMS.SectionWidget
{
    public class ProductPlug : PluginBase
    {
        public override IEnumerable<RouteDescriptor> RegistRoute()
        {
            yield return new RouteDescriptor
            {
                RouteName = "video-play",
                Template = "VideoPlayer/Play",
                Defaults = new { controller = "SectionContentVideo", action = "Play" },
                Priority = 10
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
            style("SectionAdmin").Include("~/Modules/Section/Content/Section.css", "~/Modules/Section/Content/Section.min.css", Urls.CdnHost + "/Modules/Section/Content/Section.min.css");
            style("Section").Include("~/Modules/Section/Content/SectionClient.css", "~/Modules/Section/Content/SectionClient.min.css", Urls.CdnHost + "/Modules/Section/Content/SectionClient.min.css");
        }

        public override IEnumerable<PermissionDescriptor> RegistPermission()
        {
            return null;
        }

        public override IEnumerable<Type> WidgetServiceTypes()
        {
            throw new NotImplementedException();
        }

        public override void ConfigureServices(IServiceCollection serviceCollection)
        {
            
        }
    }
}