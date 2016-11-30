/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using ZKEACMS.SectionWidget.Models;
using Easy.RepositoryPattern;

namespace ZKEACMS.SectionWidget.Service
{
    public class SectionContentParagraphService : ServiceBase<SectionContentParagraph>, ISectionContentService
    {
        public SectionContentBase.Types ContentType
        {
            get { return SectionContentBase.Types.Paragraph; }
        }

        public void AddContent(SectionContent content)
        {
            Add(content as SectionContentParagraph);
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
            Update(content as SectionContentParagraph);
        }
    }
}