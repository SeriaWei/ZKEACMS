/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using ZKEACMS.SectionWidget.Models;
using Easy.RepositoryPattern;

namespace ZKEACMS.SectionWidget.Service
{
    public class SectionContentTitleService : ServiceBase<SectionContentTitle>, ISectionContentService
    {
        public SectionContentBase.Types ContentType
        {
            get { return SectionContentBase.Types.Title; }
        }

        public void AddContent(SectionContent content)
        {
            Add(content as SectionContentTitle);
        }

        public void DeleteContent(int contentId)
        {
            Remove(contentId);
        }

        public SectionContent GetContent(int contentId)
        {
            return Get(contentId);
        }


        public void UpdateContent(SectionContent content)
        {
            Update(content as SectionContentTitle);
        }
    }
}