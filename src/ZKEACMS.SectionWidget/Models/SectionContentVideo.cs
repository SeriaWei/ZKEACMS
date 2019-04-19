/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.MetaData;
using System.ComponentModel.DataAnnotations.Schema;
using ZKEACMS.Extend;
using Easy.RepositoryPattern;

namespace ZKEACMS.SectionWidget.Models
{
    [DataTable("SectionContentVideo")]
    public class SectionContentVideo : SectionContentBasic
    {
        public string VideoTitle { get; set; }
        public string Thumbnail { get; set; }
        public int? Width { get; set; }
        public int? Height { get; set; }
        public string Url { get; set; }
        public string Code { get; set; }
        [NotMapped]
        public override int SectionContentType
        {
            get
            {
                return (int)Types.Video;
            }
        }
    }

    class SectionContentVideoMetaData : ViewMetaData<SectionContentVideo>
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
            ViewConfig(m => m.VideoTitle).AsTextBox().Required();
            ViewConfig(m => m.Thumbnail).AsTextBox().Required().MediaSelector();
            ViewConfig(m => m.Url).AsTextBox().AddClass(StringKeys.SelectVideoClass).AddProperty("data-url", Urls.SelectMedia);
            ViewConfig(m => m.Code).AsTextArea().MaxLength(500);
        }
    }
}