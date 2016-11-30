/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.MetaData;
using System.ComponentModel.DataAnnotations.Schema;

namespace ZKEACMS.SectionWidget.Models
{
    [ViewConfigure(typeof(SectionContentVideoMetaData)), Table("SectionContentVideo")]
    public class SectionContentVideo : SectionContent
    {
        public string VideoTitle { get; set; }
        public string Thumbnail { get; set; }
        public int? Width { get; set; }
        public int? Height { get; set; }
        public string Url { get; set; }
        public string Code { get; set; }

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
            ViewConfig(m => m.VideoTitle).AsTextBox().Required();
            ViewConfig(m => m.Thumbnail).AsTextBox().Required().AddClass(StringKeys.SelectImageClass).AddProperty("data-url", Urls.SelectMedia);
            ViewConfig(m => m.Url).AsTextBox().AddClass(StringKeys.SelectVideoClass).AddProperty("data-url", Urls.SelectMedia);
            ViewConfig(m => m.Code).AsTextArea().MaxLength(500);
        }
    }
}