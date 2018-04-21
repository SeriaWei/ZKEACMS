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
                GroupName = "1.ͨ��",
                PartialView = "Widget.HTML",
                Thumbnail = "~/images/Widget.HTML.png",
                Order = 1
            },
            new WidgetTemplateEntity<ImageWidgetService>
            {
                Title = "ͼƬ",
                GroupName = "1.ͨ��",
                PartialView = "Widget.Image",
                Thumbnail = "~/images/Widget.Image.png",
                Order = 2
            },
            new WidgetTemplateEntity<CarouselWidgetService>
            {
                Title = "����ͼ",
                GroupName = "1.ͨ��",
                PartialView = "Widget.Carousel",
                Thumbnail = "~/images/Widget.Carousel.png",
                Order = 3
            },
            new WidgetTemplateEntity<NavigationWidgetService>
            {
                Title = "����",
                GroupName = "1.ͨ��",
                PartialView = "Widget.Navigation",
                Thumbnail = "~/images/Widget.Navigation.png",
                Order = 4
            },
            new WidgetTemplateEntity<VideoWidgetService>
            {
                Title = "��Ƶ",
                GroupName = "1.ͨ��",
                PartialView = "Widget.Video",
                Thumbnail = "~/images/Widget.Video.png",
                Order = 5
            },
            new WidgetTemplateEntity<BreadcrumbWidgetService>
            {
                Title = "·������",
                GroupName = "1.ͨ��",
                PartialView = "Widget.Breadcrumb",
                Thumbnail = "~/images/Widget.Breadcrumb.png",
                Order = 6
            },
            new WidgetTemplateEntity<ScriptWidgetService>
            {
                Title = "�ű�",
                GroupName = "1.ͨ��",
                PartialView = "Widget.Script",
                Thumbnail = "~/images/Widget.Script.png",
                Order = 7
            },
            new WidgetTemplateEntity<StyleSheetWidgetService>
            {
                Title = "��ʽ",
                GroupName = "1.ͨ��",
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
