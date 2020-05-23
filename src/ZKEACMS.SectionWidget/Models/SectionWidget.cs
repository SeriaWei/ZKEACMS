/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using Easy.MetaData;
using ZKEACMS.Widget;
using ZKEACMS.MetaData;
using System.ComponentModel.DataAnnotations.Schema;
using Easy.RepositoryPattern;

namespace ZKEACMS.SectionWidget.Models
{
    [DataTable("SectionWidget")]
    public class SectionWidget : BasicWidget
    {
        public string SectionTitle { get; set; }
        [NotMapped]
        public IEnumerable<SectionGroup> Groups { get; set; }
        [NotMapped]
        public SectionTemplate Template { get; set; }
    }

    class SectionWidgetMetaData : WidgetMetaData<SectionWidget>
    {
        protected override void ViewConfigure()
        {
            base.ViewConfigure();
            ViewConfig(m => m.PartialView).AsHidden();
            ViewConfig(m => m.SectionTitle).AsHidden();
            ViewConfig(m => m.Template).AsHidden().Ignore();
            ViewConfig(m => m.Groups).AsHidden().Ignore();
        }
    }
}