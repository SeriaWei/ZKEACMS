/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.Linq;
using Easy;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Common.Models;
using ZKEACMS.Common.Service;
using ZKEACMS.Widget;

namespace ZKEACMS.WidgetTemplate
{
    public class WidgetTemplateService : IWidgetTemplateService
    {
        public static List<WidgetTemplateEntity> KnownWidgets = new List<WidgetTemplateEntity>
        {
            new WidgetTemplateEntity<HtmlWidgetService>
            {
                Title = "HTML",
                GroupName = "1.General",
                PartialView = "Widget.HTML",
                Thumbnail = "~/images/Widget.HTML.png",
                Order = 1
            },
            new WidgetTemplateEntity<ImageWidgetService>
            {
                Title = "Picture",
                GroupName = "1.General",
                PartialView = "Widget.Image",
                Thumbnail = "~/images/Widget.Image.png",
                Order = 2
            },
            new WidgetTemplateEntity<CarouselWidgetService>
            {
                Title = "Carousel",
                GroupName = "1.General",
                PartialView = "Widget.Carousel",
                Thumbnail = "~/images/Widget.Carousel.png",
                Order = 3
            },
            new WidgetTemplateEntity<NavigationWidgetService>
            {
                Title = "Navigation",
                GroupName = "1.General",
                PartialView = "Widget.Navigation",
                Thumbnail = "~/images/Widget.Navigation.png",
                Order = 4
            },
            new WidgetTemplateEntity<VideoWidgetService>
            {
                Title = "Video",
                GroupName = "1.General",
                PartialView = "Widget.Video",
                Thumbnail = "~/images/Widget.Video.png",
                Order = 5
            },
            new WidgetTemplateEntity<BreadcrumbWidgetService>
            {
                Title = "Breadcrumbs",
                GroupName = "1.General",
                PartialView = "Widget.Breadcrumb",
                Thumbnail = "~/images/Widget.Breadcrumb.png",
                Order = 6
            },
            new WidgetTemplateEntity<ScriptWidgetService>
            {
                Title = "JavaScript",
                GroupName = "1.General",
                PartialView = "Widget.Script",
                Thumbnail = "~/images/Widget.Script.png",
                Order = 7
            },
            new WidgetTemplateEntity<StyleSheetWidgetService>
            {
                Title = "Style",
                GroupName = "1.General",
                PartialView = "Widget.StyleSheet",
                Thumbnail = "~/images/Widget.StyleSheet.png",
                Order = 8
            },
            new WidgetTemplateEntity<TabWidgetService>
            {
                Title = "Tab",
                GroupName = "1.General",
                PartialView = "Widget.Tab",
                Thumbnail = "~/images/Widget.Tab.png",
                Order = 9
            },
            new WidgetTemplateEntity<HeadWidgetService>
            {
                Title = "Head",
                GroupName = "1.General",
                PartialView = "Widget.Head",
                Thumbnail = "~/images/Widget.Head.png",
                Order = 10
            }
        };

        public IList<WidgetTemplateEntity> Get()
        {
            return KnownWidgets;
        }

        public WidgetTemplateEntity Get(string Id)
        {
            return Get(m => m.ID == Id).First();
        }

        public IList<WidgetTemplateEntity> Get(Func<WidgetTemplateEntity, bool> filter)
        {
            return Get().Where(filter).ToList();
        }
    }
}
