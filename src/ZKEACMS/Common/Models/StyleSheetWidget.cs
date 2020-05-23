/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.MetaData;
using ZKEACMS.MetaData;
using ZKEACMS.Widget;
using System.ComponentModel.DataAnnotations.Schema;
using Easy.RepositoryPattern;
using ZKEACMS.Extend;

namespace ZKEACMS.Common.Models
{
    [DataTable("StyleSheetWidget")]
    public class StyleSheetWidget : BasicWidget
    {
        public string StyleSheet { get; set; }
    }

    class StyleSheetWidgetMetaData : WidgetMetaData<StyleSheetWidget>
    {
        protected override void ViewConfigure()
        {
            base.ViewConfigure();
            ViewConfig(m => m.PartialView).AsHidden();
            ViewConfig(m => m.Title).AsHidden();
            ViewConfig(m => m.StyleClass).AsHidden();
            ViewConfig(m => m.StyleSheet).AsTextArea().AsCodeEditor().Order(NextOrder()).Required();
        }
    }
}