/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Xml;
using ZKEACMS.SectionWidget.Models;
using Easy.Extend;
using Easy.Reflection;
using Easy.RepositoryPattern;
using Microsoft.AspNetCore.Hosting;
using Easy;

namespace ZKEACMS.SectionWidget.Service
{
    public class SectionGroupService : ServiceBase<SectionGroup>, ISectionGroupService
    {
        private readonly ISectionContentProviderService _sectionContentProviderService;
        private readonly IHostingEnvironment _hostingEnvironment;
        public SectionGroupService(ISectionContentProviderService sectionContentProviderService, IHostingEnvironment hostingEnvironment)
        {
            _sectionContentProviderService = sectionContentProviderService;
            _hostingEnvironment = hostingEnvironment;
        }
        public SectionGroup GenerateContentFromConfig(SectionGroup group)
        {
            string configFile = _hostingEnvironment.WebRootPath + @"Modules\Section\Views\Thumbnail\{0}.xml".FormatWith(group.PartialView);
            List<SectionContent> contents = new List<SectionContent>();
            if (File.Exists(configFile))
            {
                XmlDocument doc = new XmlDocument();
                FileStream fileStream = new FileStream(configFile, FileMode.Open);
                doc.Load(fileStream);
                var nodes = doc.SelectNodes("/required/item");
                foreach (XmlNode item in nodes)
                {
                    var attr = item.Attributes["type"];
                    if (attr != null && attr.Value.IsNotNullAndWhiteSpace())
                    {
                        try
                        {
                            throw new NotImplementedException();
                            var content = Activator.CreateInstance(null) as SectionContent;
                            var properties = item.SelectNodes("property");
                            foreach (XmlNode property in properties)
                            {
                                var name = property.Attributes["name"];
                                if (name != null && name.Value.IsNotNullAndWhiteSpace() && property.InnerText.IsNotNullAndWhiteSpace())
                                {
                                    ClassAction.SetObjPropertyValue(content, name.Value, property.InnerText);
                                }
                            }
                            content.SectionGroupId = group.ID;
                            content.SectionWidgetId = group.SectionWidgetId;
                            contents.Add(content);
                        }
                        catch (Exception ex)
                        {
                            Logger.Error(ex);
                        }
                    }
                }
            }
            group.SectionContents = contents;
            return group;
        }
        public override void Add(SectionGroup item)
        {
            base.Add(item);
            if (item.SectionContents != null && item.SectionContents.Any())
            {
                item.SectionContents.Each(m =>
                {
                    m.SectionGroupId = item.ID;
                    m.SectionWidgetId = item.SectionWidgetId;
                    _sectionContentProviderService.Add(m);
                });
            }
            if (item.IsLoadDefaultData)
            {
                GenerateContentFromConfig(item);
                if (item.SectionContents != null && item.SectionContents.Any())
                {
                    item.SectionContents.Each(c =>
                    {
                        _sectionContentProviderService.Add(c);
                    });
                }
            }
        }
        public override void Remove(params object[] primaryKeys)
        {
            var group = Get(primaryKeys);
            var contents = _sectionContentProviderService.Get(m => m.SectionGroupId == group.ID);
            contents.Each(m =>
            {
                _sectionContentProviderService.Remove(m.ID);
            });
            base.Remove(primaryKeys);
        }
    }
}