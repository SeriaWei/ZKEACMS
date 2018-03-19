/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Collections.Generic;
using System.Linq;
using ZKEACMS.SectionWidget.Models;
using Easy.RepositoryPattern;
using Easy;
using Microsoft.EntityFrameworkCore;
using System;
using Easy.Extend;

namespace ZKEACMS.SectionWidget.Service
{
    public class SectionContentProviderService : ServiceBase<SectionContentBasePart>, ISectionContentProviderService
    {
        private readonly IEnumerable<ISectionContentService> _sectionContentServices;

        public SectionContentProviderService(IEnumerable<ISectionContentService> sectionContentServices, IApplicationContext applicationContext, CMSDbContext dbContext)
            : base(applicationContext, dbContext)
        {
            _sectionContentServices = sectionContentServices;
        }        
        public void Add(SectionContent item)
        {
            if (!item.Order.HasValue || item.Order.Value == 0)
            {
                item.Order = Count(m => m.SectionWidgetId == item.SectionWidgetId && m.SectionGroupId == item.SectionGroupId) + 1;
            }
            var contentBase = item.ToContent();
            contentBase.ID = Guid.NewGuid().ToString("N");
            base.Add(contentBase);
            item.ID = contentBase.ID;
            _sectionContentServices.First(m => (int)m.ContentType == item.SectionContentType).AddContent(item);
        }
        public void Update(SectionContent item)
        {
            var content = Get(item.ID);
            item.CopyTo(content);
            base.Update(content);
            _sectionContentServices.First(m => (int)m.ContentType == item.SectionContentType).UpdateContent(item);
        }


        public SectionContent GetContent(string contentId)
        {
            var item = base.Get(contentId);
            if (item != null)
            {
                var result = _sectionContentServices.First(m => (int)m.ContentType == item.SectionContentType).GetContent(item.ID);
                result.Order = item.Order;
                result.SectionGroupId = item.SectionGroupId;
                result.SectionWidgetId = item.SectionWidgetId;
                return result;
            }
            return null;
        }

        public override void Remove(SectionContentBasePart item)
        {
            _sectionContentServices.First(m => (int)m.ContentType == item.SectionContentType).DeleteContent(item.ID);
            base.Remove(item);
        }


        public SectionContent FillContent(SectionContent content)
        {
            return
                content.InitContent(
                    _sectionContentServices.First(m => (int)m.ContentType == content.SectionContentType)
                        .GetContent(content.ID));
        }

        public void SaveSort(SectionContent content)
        {
            var contentPart = content.ToContent();
            CurrentDbSet.Attach(contentPart);
            DbContext.Entry(contentPart).Property(n => n.Order).IsModified = true;
            DbContext.SaveChanges();
        }
    }
}