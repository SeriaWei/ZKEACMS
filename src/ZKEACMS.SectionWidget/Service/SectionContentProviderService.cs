/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Collections.Generic;
using System.Linq;
using ZKEACMS.SectionWidget.Models;
using Easy.RepositoryPattern;

namespace ZKEACMS.SectionWidget.Service
{
    public class SectionContentProviderService : ServiceBase<SectionContent>, ISectionContentProviderService
    {
        private readonly IEnumerable<ISectionContentService> _sectionContentServices;
        public SectionContentProviderService(IEnumerable<ISectionContentService> sectionContentServices)
        {
            _sectionContentServices = sectionContentServices;
        }
        public override void Add(SectionContent item)
        {
            if (!item.Order.HasValue || item.Order.Value == 0)
            {
                item.Order = Count(m => m.SectionWidgetId == item.SectionWidgetId && m.SectionGroupId == item.SectionGroupId) + 1;
            }
            var contentBase = item.ToContent();
            base.Add(contentBase);
            item.ID = contentBase.ID;
            _sectionContentServices.First(m => (int)m.ContentType == item.SectionContentType).AddContent(item);
        }
        public override void Update(SectionContent item)
        {
            base.Update(item.ToContent());
            _sectionContentServices.First(m => (int)m.ContentType == item.SectionContentType).UpdateContent(item);
        }
       
        public override SectionContent Get(params object[] primaryKeys)
        {
            var item = base.Get(primaryKeys);
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


        public override void Remove(params object[] primaryKey)
        {
            var content = base.Get(primaryKey);
            _sectionContentServices.First(m => (int)m.ContentType == content.SectionContentType).DeleteContent(content.ID);
            base.Remove(primaryKey);
        }
        public SectionContent FillContent(SectionContent content)
        {
            return
                content.InitContent(
                    _sectionContentServices.First(m => (int)m.ContentType == content.SectionContentType)
                        .GetContent(content.ID));
        }
    }
}