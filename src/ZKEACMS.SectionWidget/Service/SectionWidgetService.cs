/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
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

namespace ZKEACMS.SectionWidget.Service
{
    public class SectionWidgetService : WidgetService<Models.SectionWidget,SectionDbContext>, ISectionWidgetService
    {
        private readonly ISectionGroupService _sectionGroupService;
        private readonly ISectionContentProviderService _sectionContentProviderService;
        private readonly ISectionTemplateService _sectionTemplateService;


        public SectionWidgetService(IWidgetBasePartService widgetService, ISectionGroupService sectionGroupService,
            ISectionContentProviderService sectionContentProviderService,
            ISectionTemplateService sectionTemplateService,
            IApplicationContext applicationContext)
            : base(widgetService, applicationContext)
        {
            _sectionGroupService = sectionGroupService;
            _sectionContentProviderService = sectionContentProviderService;
            _sectionTemplateService = sectionTemplateService;
        }

        public override DbSet<Models.SectionWidget> CurrentDbSet
        {
            get
            {
                return DbContext.SectionWidget;
            }
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
            widget.Groups = _sectionGroupService.Get(m => m.SectionWidgetId == widget.ID).ToList();
            var contents = _sectionContentProviderService.Get(m => m.SectionWidgetId == widget.ID).ToList();
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
                m.SectionContents = filled.Where(n => n.SectionGroupId == m.ID).ToList();
            });
            return widget;
        }

        
        public override void Remove(params object[] primaryKeys)
        {
            Get(primaryKeys).Groups.Each(m =>
            {
                _sectionGroupService.Remove(m.ID);
            });
            base.Remove(primaryKeys);
        }

        public override void Add(Models.SectionWidget item)
        {
            base.Add(item);
            if (item.Groups != null && item.Groups.Any())
            {
                item.Groups.Each(m =>
                {
                    m.SectionWidgetId = item.ID;
                    _sectionGroupService.Add(m);
                });
            }
        }

        public override ZipFile PackWidget(WidgetBase widget)
        {
            var sectionWidget = GetWidget(widget) as Models.SectionWidget;
            var zipFile = base.PackWidget(widget);
            var rootPath = (ApplicationContext as CMSApplicationContext).MapPath("~/");
            var files = new[]
               {
                "~/Modules/Section/Views/{0}.cshtml",
                "~/Modules/Section/Views/Thumbnail/{0}.png",
                "~/Modules/Section/Views/Thumbnail/{0}.xml",
                "~/Modules/Section/Views/Thumbnail/{0}.json"
            };
            sectionWidget.Groups.Each(g =>
            {
                var template = _sectionTemplateService.Get(g.PartialView);
                string infoFile = (ApplicationContext as CMSApplicationContext).MapPath("~/Modules/Section/Views/Thumbnail/{0}.json".FormatWith(template.TemplateName));
                using (var writer = File.CreateText(infoFile))
                {
                    writer.Write(JsonConvert.SerializeObject(template));
                }
                zipFile.AddFile(new FileInfo(infoFile), Path.GetDirectoryName(infoFile.Replace(rootPath, @"\")));

                files.Each(f =>
                {
                    string file = (ApplicationContext as CMSApplicationContext).MapPath(f.FormatWith(template.TemplateName));
                    if (File.Exists(file))
                    {
                        zipFile.AddFile(new FileInfo(file), Path.GetDirectoryName(file.Replace(rootPath, @"\")));
                    }
                });

            });

            return zipFile;
        }
        public override WidgetBase UnPackWidget(ZipFileInfoCollection pack)
        {
            Models.SectionWidget widget = null;
            foreach (ZipFileInfo item in pack)
            {
                if (item.RelativePath.EndsWith("-widget.json"))
                {
                    widget = JsonConvert.DeserializeObject<Models.SectionWidget>(Encoding.UTF8.GetString(item.FileBytes), new SectionContentJsonConverter());
                    continue;
                }

                using (var fs = File.Create((ApplicationContext as CMSApplicationContext).MapPath("~" + item.RelativePath)))
                {
                    fs.Write(item.FileBytes, 0, item.FileBytes.Length);
                }

                if (item.RelativePath.EndsWith(".json"))
                {
                    var template = JsonConvert.DeserializeObject<SectionTemplate>(Encoding.UTF8.GetString(item.FileBytes));
                    if (_sectionTemplateService.Count(m => m.TemplateName == template.TemplateName) > 0)
                    {
                        _sectionTemplateService.Update(template);
                    }
                    else
                    {
                        _sectionTemplateService.Add(template);
                    }
                }

            }
            return widget;
        }
    }
}