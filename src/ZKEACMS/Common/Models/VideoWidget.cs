/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.MetaData;
using ZKEACMS;
using ZKEACMS.MetaData;
using ZKEACMS.Widget;
using System.ComponentModel.DataAnnotations.Schema;

namespace ZKEACMS.Common.Models
{
    [Table("VideoWidget")]
    public class VideoWidget : BasicWidget
    {
        public int? Width { get; set; }
        public int? Height { get; set; }
        public string Url { get; set; }
        public string Code { get; set; }
    }

    class VideoWidgetMetaData : WidgetMetaData<VideoWidget>
    {
        protected override void ViewConfigure()
        {
            base.ViewConfigure();
            ViewConfig(m => m.Url).AsTextBox().Order(NextOrder()).AddClass(StringKeys.SelectVideoClass).AddProperty("data-url", Urls.SelectMedia);
            ViewConfig(m => m.Code).AsTextArea().Order(NextOrder()).MaxLength(500);
        }
    }
}