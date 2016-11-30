/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using Easy.MetaData;
using ZKEACMS.Widget;
using ZKEACMS.MetaData;

namespace ZKEACMS.SectionWidget.Models
{
    [ViewConfigure(typeof(SectionWidgetMetaData))]
    public class SectionWidget : WidgetBase
    {
        public string SectionTitle { get; set; }
        public IEnumerable<SectionGroup> Groups { get; set; }
    }

    class SectionWidgetMetaData : WidgetMetaData<SectionWidget>
    {
        protected override void ViewConfigure()
        {
            base.ViewConfigure();
            ViewConfig(m => m.SectionTitle).AsHidden();
        }
    }
}