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
    public class SectionGroupService : ServiceBase<SectionGroup, SectionDbContext>, ISectionGroupService
    {
        private readonly ISectionContentProviderService _sectionContentProviderService;
        private readonly IPluginLoader _pluginLoader;

        public SectionGroupService(ISectionContentProviderService sectionContentProviderService,
            IPluginLoader pluginLoader, IApplicationContext applicationContext) : base(applicationContext)
        {
            _sectionContentProviderService = sectionContentProviderService;
            _pluginLoader = pluginLoader;
        }

        public override DbSet<SectionGroup> CurrentDbSet
        {
            get
            {
                return DbContext.SectionGroup;
            }
        }

        public SectionGroup GenerateContentFromConfig(SectionGroup group)
        {
            string configFile = _pluginLoader.GetPlugins().First(m => m.ID == SectionPlug.PluginID).RelativePath + @"\Thumbnail\{0}.xml".FormatWith(group.PartialView);
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
        public override void Add(SectionGroup item)
        {
            item.ID = Guid.NewGuid().ToString("N");
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
        public override void Remove(SectionGroup item, bool saveImmediately = true)
        {
            if (item != null)
            {
                var contents = _sectionContentProviderService.Get(m => m.SectionGroupId == item.ID);
                contents.Each(m =>
                {
                    _sectionContentProviderService.Remove(m.ID);
                });
            }
            base.Remove(item, saveImmediately);
        }
    }
}