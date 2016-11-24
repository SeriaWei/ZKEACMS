/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.MetaData;
using ZKEACMS.MetaData;
using System.ComponentModel.DataAnnotations.Schema;
using ZKEACMS.Widget;

namespace ZKEACMS.Common.Models
{
    [ViewConfigure(typeof(HtmlWidgetMetaData)), Table("HtmlWidget")]
    public class HtmlWidget : BasicWidget
    {
        public string HTML { get; set; }
    }
    class HtmlWidgetMetaData : WidgetMetaData<HtmlWidget>
    {
        protected override void ViewConfigure()
        {
            base.ViewConfigure();
            ViewConfig(m => m.HTML).AsTextArea().AddClass("html").Order(NextOrder());
        }
    }

}
