using System;
using System.Collections.Generic;
using System.Text;
using ZKEACMS.Extend;
using ZKEACMS.MetaData;
using ZKEACMS.Widget;

namespace ZKEACMS.Common.Models
{
    public class HeadWidget : SimpleWidgetBase
    {
        public string Content { get; set; }
    }
    class HeaderWidgetMetaData : WidgetMetaData<HeadWidget>
    {
        protected override void ViewConfigure()
        {
            base.ViewConfigure();
            ViewConfig(m => m.Content).AsTextArea().AsCodeEditor().Order(NextOrder()).Required();
        }
    }
}
