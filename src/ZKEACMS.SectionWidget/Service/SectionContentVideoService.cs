/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using ZKEACMS.SectionWidget.Models;
using Easy.RepositoryPattern;

namespace ZKEACMS.SectionWidget.Service
{
    public class SectionContentVideoService : ServiceBase<SectionContentVideo>, ISectionContentService
    {
        public SectionContentBase.Types ContentType
        {
            get { return SectionContentBase.Types.Video; }
        }

        public void AddContent(SectionContent content)
        {
            Add(content as SectionContentVideo);
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
            Update(content as SectionContentVideo);
        }
    }
}