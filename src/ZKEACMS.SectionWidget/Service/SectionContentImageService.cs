/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using ZKEACMS.SectionWidget.Models;
using Easy.RepositoryPattern;
using Easy;

namespace ZKEACMS.SectionWidget.Service
{
    public class SectionContentImageService : ServiceBase<SectionContentImage>, ISectionContentService
    {
        public SectionContentImageService(IApplicationContext applicationContext) : base(applicationContext)
        {
        }

        public SectionContentBase.Types ContentType
        {
            get { return SectionContentBase.Types.Image; }
        }

        public void AddContent(SectionContent content)
        {
            Add(content as SectionContentImage);
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
            Update(content as SectionContentImage);
        }
    }
}