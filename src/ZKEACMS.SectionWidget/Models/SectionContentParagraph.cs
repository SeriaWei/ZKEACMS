/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.MetaData;
using System.ComponentModel.DataAnnotations.Schema;

namespace ZKEACMS.SectionWidget.Models
{
    [ViewConfigure(typeof(SectionContentParagraphMetaData)), Table("SectionContentParagraph")]
    public class SectionContentParagraph : SectionContent
    {
        public string HtmlContent { get; set; }
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
            ViewConfig(m => m.HtmlContent).AsTextArea().AddClass("html");
        }
    }
}