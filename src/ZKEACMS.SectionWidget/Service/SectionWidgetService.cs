/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using ZKEACMS.SectionWidget.ContentJsonConvert;
using ZKEACMS.SectionWidget.Models;
using Easy.Extend;
using Newtonsoft.Json;
using ZKEACMS.Widget;
using Easy.Zip;
using Easy;
using Microsoft.EntityFrameworkCore;
using System;
using Newtonsoft.Json.Linq;
using Easy.Mvc.Plugin;
using Easy.RepositoryPattern;
using ZKEACMS.Common.Service;
using Microsoft.AspNetCore.Razor.Hosting;
using Microsoft.AspNetCore.Mvc.Razor.Compilation;
using ZKEACMS.PackageManger;

namespace ZKEACMS.SectionWidget.Service
{
    public class SectionWidgetService : WidgetService<Models.SectionWidget>, ISectionWidgetService
    {
        private readonly ISectionGroupService _sectionGroupService;
        private readonly ISectionContentProviderService _sectionContentProviderService;
        private readonly ISectionTemplateService _sectionTemplateService;


        public SectionWidgetService(IWidgetBasePartService widgetService, ISectionGroupService sectionGroupService,
            ISectionContentProviderService sectionContentProviderService, ISectionTemplateService sectionTemplateService,
            IApplicationContext applicationContext, CMSDbContext dbContext)
            : base(widgetService, applicationContext, dbContext)
        {
            _sectionGroupService = sectionGroupService;
            _sectionContentProviderService = sectionContentProviderService;
            _sectionTemplateService = sectionTemplateService;
        }

        public override WidgetBase GetWidget(WidgetBase widget)
        {
            Models.SectionWidget sectionWidget = base.GetWidget(widget) as Models.SectionWidget;
            return InitSectionWidget(sectionWidget);
        }

        public override Models.SectionWidget Get(params object[] primaryKeys)
        {
            Models.SectionWidget widget = base.Get(primaryKeys);
            return InitSectionWidget(widget);
        }

        private Models.SectionWidget InitSectionWidget(Models.SectionWidget widget)
        {
            if (widget == null) return null;

            widget.Groups = _sectionGroupService.Get(m => m.SectionWidgetId == widget.ID).OrderBy(m => m.Order).ToList();
            var contents = _sectionContentProviderService.Get(m => m.SectionWidgetId == widget.ID);
            List<SectionContent> filled = new List<SectionContent>();
            contents.AsParallel().Each(content =>
            {
                var contentFull = _sectionContentProviderService.FillContent(content);
                if (contentFull != null)
                {
                    filled.Add(contentFull);
                }
            });

            widget.Groups.Each(m =>
            {
                m.SectionContents = filled.Where(n => n.SectionGroupId == m.ID).OrderBy(c => c.Order).ToList();
            });
            return widget;
        }
        public override void Remove(Models.SectionWidget item)
        {
            if (item != null)
            {
                item.Groups.Each(m =>
                {
                    _sectionGroupService.Remove(m.ID);
                });
            }
            base.Remove(item);
        }

        public override ServiceResult<Models.SectionWidget> Add(Models.SectionWidget item)
        {
            var result = base.Add(item);
            if (result.HasViolation)
            {
                return result;
            }
            if (item.Groups != null && item.Groups.Any())
            {
                item.Groups.Each(m =>
                {
                    m.SectionWidgetId = item.ID;
                    _sectionGroupService.Add(m);
                });
            }
            return result;
        }
        public override WidgetPackage PackWidget(WidgetBase widget)
        {
            var package = base.PackWidget(widget);
            var sectionWidget = package.Widget as Models.SectionWidget;

            sectionWidget.Groups.Each(group =>
            {
                foreach (var item in group.SectionImages)
                {
                    AddFileToPackage(package, item.ImageSrc);
                }
                foreach (var item in group.Videos)
                {
                    AddFileToPackage(package, item.Thumbnail);
                }
                var template = _sectionTemplateService.Get(group.PartialView);
                sectionWidget.Template = template;

                AddFileToPackage(package, $"~/Plugins/ZKEACMS.SectionWidget/Views/{template.TemplateName}.cshtml".FormatWith(sectionWidget.Template.TemplateName));
                AddFileToPackage(package, $"~/Plugins/ZKEACMS.SectionWidget/{template.Thumbnail}");
                AddFileToPackage(package, $"~/Plugins/ZKEACMS.SectionWidget/{template.ExampleData}");
            });
            return package;
        }
        public override void InstallWidget(WidgetPackage pack)
        {
            var filePackageInstaller = new FilePackageInstaller(ApplicationContext.HostingEnvironment);
            filePackageInstaller.AddtionalUsing = new string[] { "@using ZKEACMS.SectionWidget", "@using ZKEACMS.SectionWidget.Models", "@using ZKEACMS.SectionWidget.Service" };
            filePackageInstaller.Install(pack);

            var widget = JsonConvert.DeserializeObject<Models.SectionWidget>(JObject.Parse(pack.ToString()).GetValue("Widget").ToString(), new SectionContentJsonConverter());

            if (_sectionTemplateService.Count(m => m.TemplateName == widget.Template.TemplateName) == 0)
            {
                _sectionTemplateService.Add(widget.Template);
            }
            widget.PageId = null;
            widget.LayoutId = null;
            widget.ZoneId = null;
            widget.IsSystem = false;
            widget.IsTemplate = true;
            widget.Description = "Install";
            AddWidget(widget);
        }
    }
}