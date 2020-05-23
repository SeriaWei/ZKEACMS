/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.MetaData;
using ZKEACMS;
using ZKEACMS.MetaData;
using ZKEACMS.Widget;
using System.ComponentModel.DataAnnotations.Schema;
using ZKEACMS.Extend;
using Easy.RepositoryPattern;

namespace ZKEACMS.Common.Models
{
    [DataTable("ImageWidget")]
    public class ImageWidget : BasicWidget
    {
        public string ImageUrl { get; set; }
        public int? Width { get; set; }
        public int? Height { get; set; }
        public string Link { get; set; }
        public string AltText { get; set; }
    }
    class ImageWidgetMedaData : WidgetMetaData<ImageWidget>
    {
        protected override void ViewConfigure()
        {
            base.ViewConfigure();
            ViewConfig(m => m.ImageUrl).AsTextBox().Required().Order(NextOrder()).MediaSelector();
        }
    }
}