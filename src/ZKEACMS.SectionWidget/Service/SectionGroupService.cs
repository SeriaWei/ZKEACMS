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

namespace ZKEACMS.SectionWidget.Service
{
    public class SectionGroupService : ServiceBase<SectionGroup, SectionDbContext>, ISectionGroupService
    {
        private readonly ISectionContentProviderService _sectionContentProviderService;
        private readonly IHostingEnvironment _hostingEnvironment;

        public SectionGroupService(ISectionContentProviderService sectionContentProviderService,
            IHostingEnvironment hostingEnvironment, IApplicationContext applicationContext) : base(applicationContext)
        {
            _sectionContentProviderService = sectionContentProviderService;
            _hostingEnvironment = hostingEnvironment;
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
        public override void Remove(SectionGroup item)
        {
            if (item != null)
            {
                var contents = _sectionContentProviderService.Get(m => m.SectionGroupId == item.ID).ToList();
                contents.Each(m =>
                {
                    _sectionContentProviderService.Remove(m.ID);
                });
            }
            base.Remove(item);
        }
    }
}