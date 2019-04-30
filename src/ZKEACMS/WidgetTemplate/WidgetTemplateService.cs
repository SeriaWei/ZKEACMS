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
                GroupName = "1.通用",
                PartialView = "Widget.HTML",
                Thumbnail = "~/images/Widget.HTML.png",
                Order = 1
            },
            new WidgetTemplateEntity<ImageWidgetService>
            {
                Title = "图片",
                GroupName = "1.通用",
                PartialView = "Widget.Image",
                Thumbnail = "~/images/Widget.Image.png",
                Order = 2
            },
            new WidgetTemplateEntity<CarouselWidgetService>
            {
                Title = "焦点图",
                GroupName = "1.通用",
                PartialView = "Widget.Carousel",
                Thumbnail = "~/images/Widget.Carousel.png",
                Order = 3
            },
            new WidgetTemplateEntity<NavigationWidgetService>
            {
                Title = "导航",
                GroupName = "1.通用",
                PartialView = "Widget.Navigation",
                Thumbnail = "~/images/Widget.Navigation.png",
                Order = 4
            },
            new WidgetTemplateEntity<VideoWidgetService>
            {
                Title = "视频",
                GroupName = "1.通用",
                PartialView = "Widget.Video",
                Thumbnail = "~/images/Widget.Video.png",
                Order = 5
            },
            new WidgetTemplateEntity<BreadcrumbWidgetService>
            {
                Title = "路径导航",
                GroupName = "1.通用",
                PartialView = "Widget.Breadcrumb",
                Thumbnail = "~/images/Widget.Breadcrumb.png",
                Order = 6
            },
            new WidgetTemplateEntity<ScriptWidgetService>
            {
                Title = "脚本",
                GroupName = "1.通用",
                PartialView = "Widget.Script",
                Thumbnail = "~/images/Widget.Script.png",
                Order = 7
            },
            new WidgetTemplateEntity<StyleSheetWidgetService>
            {
                Title = "样式",
                GroupName = "1.通用",
                PartialView = "Widget.StyleSheet",
                Thumbnail = "~/images/Widget.StyleSheet.png",
                Order = 8
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
