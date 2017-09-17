/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Mvc.Resource;
using Easy.Mvc.Route;
using System;
using System.Collections.Generic;
using ZKEACMS;
using ZKEACMS.Common.Models;
using Microsoft.Extensions.DependencyInjection;
using ZKEACMS.SectionWidget.Service;
using Microsoft.AspNetCore.Mvc.ApplicationParts;
using System.Reflection;
using ZKEACMS.SectionWidget.Models;

namespace ZKEACMS.SectionWidget
{
    public class SectionPlug : PluginBase
    {
        public static Dictionary<string, Type> ContentTypes { get; } = new Dictionary<string, Type>
        {
           { "ZKEACMS.SectionWidget.Models.SectionContentCallToAction",typeof(SectionContentCallToAction)},
           { "ZKEACMS.SectionWidget.Models.SectionContentImage",typeof(SectionContentImage)},
           { "ZKEACMS.SectionWidget.Models.SectionContentParagraph",typeof(SectionContentParagraph)},
           { "ZKEACMS.SectionWidget.Models.SectionContentTitle",typeof(SectionContentTitle)},
           { "ZKEACMS.SectionWidget.Models.SectionContentVideo",typeof(SectionContentVideo)}
        };
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
            style("SectionAdmin").Include("~/Plugins/ZKEACMS.SectionWidget/Content/Section.css", "~/Plugins/ZKEACMS.SectionWidget/Content/Section.min.css");
            style("Section").Include("~/Plugins/ZKEACMS.SectionWidget/Content/SectionClient.css", "~/Plugins/ZKEACMS.SectionWidget/Content/SectionClient.min.css");
        }

        public override IEnumerable<PermissionDescriptor> RegistPermission()
        {
            return null;
        }

        public override IEnumerable<Type> WidgetServiceTypes()
        {
            yield return typeof(SectionWidgetService);
        }

        public override void ConfigureServices(IServiceCollection serviceCollection)
        {
            serviceCollection.AddTransient<ISectionGroupService, SectionGroupService>();
            serviceCollection.AddTransient<ISectionContentProviderService, SectionContentProviderService>();
            serviceCollection.AddTransient<ISectionContentService, SectionContentCallToActionService>();
            serviceCollection.AddTransient<ISectionContentService, SectionContentImageService>();
            serviceCollection.AddTransient<ISectionContentService, SectionContentParagraphService>();
            serviceCollection.AddTransient<ISectionContentService, SectionContentTitleService>();
            serviceCollection.AddTransient<ISectionContentService, SectionContentVideoService>();
            serviceCollection.AddTransient<ISectionWidgetService, SectionWidgetService>();
            serviceCollection.AddTransient<ISectionTemplateService, SectionTemplateService>();

        }

    }
}