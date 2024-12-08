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
using Easy;
using Microsoft.EntityFrameworkCore;
using System;
using Newtonsoft.Json.Linq;
using Easy.Mvc.Plugin;
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
            var filled = new List<SectionContent>();
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
            item?.Groups.Each(m =>
                {
                    _sectionGroupService.Remove(m.ID);
                });
            base.Remove(item);
        }

        public override ErrorOr<Models.SectionWidget> Add(Models.SectionWidget item)
        {
            var result = base.Add(item);
            if (result.HasError)
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
        protected override IEnumerable<string> GetFilesInWidget(Models.SectionWidget widget)
        {
            foreach (var group in widget.Groups)
            {
                foreach (var item in group.SectionImages)
                {
                    yield return item.ImageSrc;
                }
                foreach (var item in group.Videos)
                {
                    yield return item.Thumbnail;
                }
                foreach (var item in group.Paragraphs)
                {
                    foreach (var img in ParseHtmlImageUrls(item.HtmlContent))
                    {
                        yield return img;
                    }
                }
                var template = _sectionTemplateService.Get(group.PartialView);
                widget.Template = template;
                foreach (var item in GetTemplateFiles(template))
                {
                    yield return item;
                }
            }
        }
        public override void InstallWidget(WidgetPackage pack)
        {
            var widget = JsonConvert.DeserializeObject<Models.SectionWidget>(JObject.Parse(pack.ToString()).GetValue("Widget").ToString(), new SectionContentJsonConverter());

            if (_sectionTemplateService.Count(m => m.TemplateName == widget.Template.TemplateName) == 0)
            {
                _sectionTemplateService.Add(widget.Template);
            }
            else
            {
                var templateFiles = GetTemplateFiles(widget.Template);
                pack.Files = pack.Files.Where(m => !templateFiles.Contains(m.FilePath)).ToList();
            }
            var filePackageInstaller = new FilePackageInstaller(ApplicationContext.HostingEnvironment)
            {
                AddtionalUsing = new string[] { "@using ZKEACMS.SectionWidget", "@using ZKEACMS.SectionWidget.Models", "@using ZKEACMS.SectionWidget.Service" }
            };
            filePackageInstaller.Install(pack);

            widget.PageId = null;
            widget.LayoutId = null;
            widget.ZoneId = null;
            widget.IsSystem = false;
            widget.IsTemplate = true;
            widget.Description = "Install";
            AddWidget(widget);
        }

        private static HashSet<string> GetTemplateFiles(SectionTemplate template)
        {
            var result = new HashSet<string>
            {
                $"~/Plugins/ZKEACMS.SectionWidget/Views/{template.TemplateName}.cshtml".FormatWith(template.TemplateName),
                $"~/Plugins/ZKEACMS.SectionWidget/{string.Join('/', template.Thumbnail.ToWebPath())}",
                $"~/Plugins/ZKEACMS.SectionWidget/{string.Join('/', template.ExampleData.ToWebPath())}"
            };
            return result;
        }
    }
}