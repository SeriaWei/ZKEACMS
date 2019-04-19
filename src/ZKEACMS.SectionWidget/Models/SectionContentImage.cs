/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.MetaData;
using System.ComponentModel.DataAnnotations.Schema;
using ZKEACMS.Extend;
using Easy.RepositoryPattern;

namespace ZKEACMS.SectionWidget.Models
{
    [DataTable("SectionContentImage")]
    public class SectionContentImage : SectionContentBasic
    {
        public string ImageSrc { get; set; }
        public string ImageAlt { get; set; }
        public string ImageTitle { get; set; }
        public string Href { get; set; }
        public int? Width { get; set; }
        public int? Height { get; set; }
        [NotMapped]
        public override int SectionContentType
        {
            get
            {
                return (int)Types.Image;
            }
        }
    }

    class SectionContentImageMetaData : ViewMetaData<SectionContentImage>
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
            ViewConfig(m => m.ImageSrc).AsTextBox().Required().MediaSelector();
            ViewConfig(m => m.Href).AsTextBox().PageSelector();
        }
    }
}