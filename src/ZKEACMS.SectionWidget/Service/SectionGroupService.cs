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
using Microsoft.EntityFrameworkCore;
using Easy.Mvc.Plugin;

namespace ZKEACMS.SectionWidget.Service
{
    public class SectionGroupService : ServiceBase<SectionGroup>, ISectionGroupService
    {
        private readonly ISectionContentProviderService _sectionContentProviderService;
        private readonly IPluginLoader _pluginLoader;

        public SectionGroupService(ISectionContentProviderService sectionContentProviderService,
            IPluginLoader pluginLoader, IApplicationContext applicationContext, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
            _sectionContentProviderService = sectionContentProviderService;
            _pluginLoader = pluginLoader;
        }

        public SectionGroup GenerateContentFromConfig(SectionGroup group)
        {
            string configFile = PluginBase.GetPath<SectionPlug>().CombinePath("Thumbnail/{0}.xml".FormatWith(group.PartialView).ToFilePath());
            List<SectionContent> contents = new List<SectionContent>();
            if (File.Exists(configFile))
            {
                using (FileStream fileStream = new FileStream(configFile, FileMode.Open))
                {
                    XmlDocument doc = new XmlDocument();
                    doc.Load(fileStream);
                    var nodes = doc.SelectNodes("/required/item");
                    const string fullNameSpace = "ZKEACMS.SectionWidget.Models.{0}";
                    foreach (XmlNode item in nodes)
                    {
                        var attr = item.Attributes["type"];

                        if (attr != null && attr.Value.IsNotNullAndWhiteSpace())
                        {
                            var typeInfoArray = attr.Value.Split('.');
                            string fullTypeInfo = fullNameSpace.FormatWith(typeInfoArray[typeInfoArray.Length - 1]);
                            if (SectionPlug.ContentTypes.ContainsKey(fullTypeInfo))
                            {
                                var content = Activator.CreateInstance(SectionPlug.ContentTypes[fullTypeInfo]) as SectionContent;
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

                        }
                    }
                }
            }
            group.SectionContents = contents;
            return group;
        }
        public override ServiceResult<SectionGroup> Add(SectionGroup item)
        {
            item.ID = Guid.NewGuid().ToString("N");
            var result = base.Add(item);
            if (result.HasViolation)
            {
                return result;
            }
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
            return result;
        }
        public override void Remove(SectionGroup item)
        {
            if (item != null)
            {
                var contents = _sectionContentProviderService.Get(m => m.SectionGroupId == item.ID);
                contents.Each(m =>
                {
                    _sectionContentProviderService.Remove(m.ID);
                });
            }
            base.Remove(item);
        }
    }
}