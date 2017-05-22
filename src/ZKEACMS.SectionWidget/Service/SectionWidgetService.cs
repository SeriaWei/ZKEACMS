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
using Newtonsoft.Json.Linq;
using Easy.Mvc.Plugin;

namespace ZKEACMS.SectionWidget.Service
{
    public class SectionWidgetService : WidgetService<Models.SectionWidget, SectionDbContext>, ISectionWidgetService
    {
        private readonly ISectionGroupService _sectionGroupService;
        private readonly ISectionContentProviderService _sectionContentProviderService;
        private readonly ISectionTemplateService _sectionTemplateService;
        private readonly IPluginLoader _pluginLoader;
        private readonly string[] packFiles = new[] { "Views/{0}.cshtml", "Thumbnail/{0}.png", "Thumbnail/{0}.xml" };

        public SectionWidgetService(IWidgetBasePartService widgetService, ISectionGroupService sectionGroupService,
            ISectionContentProviderService sectionContentProviderService, ISectionTemplateService sectionTemplateService,
            IApplicationContext applicationContext, IPluginLoader pluginLoader)
            : base(widgetService, applicationContext)
        {
            _sectionGroupService = sectionGroupService;
            _sectionContentProviderService = sectionContentProviderService;
            _sectionTemplateService = sectionTemplateService;
            _pluginLoader = pluginLoader;
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
            if (widget == null) return null;

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
        public override void Remove(Models.SectionWidget item, bool saveImmediately = true)
        {
            if (item != null)
            {
                item.Groups.Each(m =>
                {
                    _sectionGroupService.Remove(m.ID);
                });
            }
            base.Remove(item, saveImmediately);
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
        public override WidgetPackage PackWidget(WidgetBase widget)
        {
            var package = base.PackWidget(widget);
            var sectionWidget = package.Widget as Models.SectionWidget;
            var pluginRootPath = _pluginLoader.GetPlugins().First(m => m.ID == SectionPlug.PluginID).RelativePath;
            var cmsApplicationContext = ApplicationContext as CMSApplicationContext;
            var rootPath = cmsApplicationContext.MapPath("~/");

            sectionWidget.Groups.Each(g =>
            {
                sectionWidget.Template = _sectionTemplateService.Get(g.PartialView);
                packFiles.Each(f =>
                {

                    string file = cmsApplicationContext.MapPath(Path.Combine(pluginRootPath, f).FormatWith(sectionWidget.Template.TemplateName));
                    if (File.Exists(file))
                    {
                        FileInfo fileInfo = new FileInfo(file);
                        package.Files.Add(new PackageManger.FileInfo
                        {
                            FileName = fileInfo.Name,
                            FilePath = "~/" + f.FormatWith(sectionWidget.Template.TemplateName),
                            Content = File.ReadAllBytes(file)
                        });
                    }
                });

            });
            return package;
        }
        public override void InstallWidget(WidgetPackage pack)
        {
            var pluginRootPath = _pluginLoader.GetPlugins().First(m => m.ID == SectionPlug.PluginID).RelativePath;

            pack.Files.Each(file =>
            {
                var pathArray = file.FilePath.Replace("\\", "/").Split('/');
                file.FilePath = Path.Combine(pluginRootPath, pathArray[pathArray.Length - 2], pathArray[pathArray.Length - 1]);

                var directory = Path.GetDirectoryName(file.FilePath);
                if (!Directory.Exists(directory))
                {
                    Directory.CreateDirectory(directory);
                }
                File.WriteAllBytes(file.FilePath, file.Content);

            });
            pack.Widget = null;
            var widget = JsonConvert.DeserializeObject<Models.SectionWidget>(JObject.Parse(pack.Content.ToString()).GetValue("Widget").ToString(), new SectionContentJsonConverter());
            if (_sectionTemplateService.Count(m => m.TemplateName == widget.Template.TemplateName) == 0)
            {
                _sectionTemplateService.Add(widget.Template);
            }
            widget.PageID = null;
            widget.LayoutID = null;
            widget.ZoneID = null;
            widget.IsSystem = false;
            widget.IsTemplate = true;
            AddWidget(widget);
        }
    }
}