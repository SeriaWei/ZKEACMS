/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.MetaData;
using System.ComponentModel.DataAnnotations.Schema;
using Easy.RepositoryPattern;

namespace ZKEACMS.SectionWidget.Models
{
    [DataTable("SectionContentParagraph")]
    public class SectionContentParagraph : SectionContentBasic
    {
        public string HtmlContent { get; set; }
        [NotMapped]
        public override int SectionContentType
        {
            get
            {
                return (int)Types.Paragraph;
            }
        }
    }

    class SectionContentParagraphMetaData : ViewMetaData<SectionContentParagraph>
    {

        protected override void ViewConfigure()
        {
            ViewConfig(m => m.ID).AsHidden();
            ViewConfig(m => m.Title).AsHidden();
            ViewConfig(m => m.SectionContentType).AsHidden();
            ViewConfig(m => m.Order).AsHidden();
            ViewConfig(m => m.SectionGroupId).AsHidden();
            ViewConfig(m => m.SectionWidgetId).AsHidden();
            ViewConfig(m => m.Status).AsHidden();
            ViewConfig(m => m.Description).AsHidden();
            ViewConfig(m => m.HtmlContent).AsTextArea().AddClass("html");
        }
    }
}