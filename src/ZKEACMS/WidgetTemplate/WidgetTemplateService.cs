/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.Linq;
using Easy;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Common.Models;
using ZKEACMS.Common.Service;

namespace ZKEACMS.WidgetTemplate
{
    public class WidgetTemplateService : IWidgetTemplateService
    {
        public static List<WidgetTemplateEntity> KnownWidgets = new List<WidgetTemplateEntity>
        {
            new WidgetTemplateEntity
            {
                Title = "HTML",
                GroupName = "1.通用",
                PartialView = "Widget.HTML",
                AssemblyName = "ZKEACMS",
                ServiceType = typeof(HtmlWidgetService),
                ViewModelType = typeof(HtmlWidget),
                Thumbnail = "~/images/Widget.HTML.png",
                Order = 1
            },
            new WidgetTemplateEntity
            {
                Title = "图片",
                GroupName = "1.通用",
                PartialView = "Widget.Image",
                AssemblyName = "ZKEACMS",
                ServiceType = typeof(ImageWidgetService),
                ViewModelType = typeof(ImageWidget),
                Thumbnail = "~/images/Widget.Image.png",
                Order = 2
            },
            new WidgetTemplateEntity
            {
                Title = "焦点图",
                GroupName = "1.通用",
                PartialView = "Widget.Carousel",
                AssemblyName = "ZKEACMS",
                ServiceType = typeof(CarouselWidgetService),
                ViewModelType = typeof(CarouselWidget),
                Thumbnail = "~/images/Widget.Carousel.png",
                Order = 3
            },
            new WidgetTemplateEntity
            {
                Title = "导航",
                GroupName = "1.通用",
                PartialView = "Widget.Navigation",
                AssemblyName = "ZKEACMS",
                ServiceType = typeof(NavigationWidgetService),
                ViewModelType = typeof(NavigationWidget),
                Thumbnail = "~/images/Widget.Navigation.png",
                Order = 4
            },
            new WidgetTemplateEntity
            {
                Title = "视频",
                GroupName = "1.通用",
                PartialView = "Widget.Video",
                AssemblyName = "ZKEACMS",
                ServiceType = typeof(VideoWidgetService),
                ViewModelType = typeof(VideoWidget),
                Thumbnail = "~/images/Widget.Video.png",
                Order = 5
            },
            new WidgetTemplateEntity
            {
                Title = "路径导航",
                GroupName = "1.通用",
                PartialView = "Widget.Breadcrumb",
                AssemblyName = "ZKEACMS",
                ServiceType = typeof(BreadcrumbWidgetService),
                ViewModelType = typeof(BreadcrumbWidget),
                Thumbnail = "~/images/Widget.Breadcrumb.png",
                Order = 6
            },
            new WidgetTemplateEntity
            {
                Title = "脚本",
                GroupName = "1.通用",
                PartialView = "Widget.Script",
                AssemblyName = "ZKEACMS",
                ServiceType = typeof(ScriptWidgetService),
                ViewModelType = typeof(ScriptWidget),
                Thumbnail = "~/images/Widget.Script.png",
                Order = 7
            },
            new WidgetTemplateEntity
            {
                Title = "样式",
                GroupName = "1.通用",
                PartialView = "Widget.StyleSheet",
                AssemblyName = "ZKEACMS",
                ServiceType = typeof(StyleSheetWidgetService),
                ViewModelType = typeof(StyleSheetWidget),
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
