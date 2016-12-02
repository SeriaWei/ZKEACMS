/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.MetaData;
using System.ComponentModel.DataAnnotations.Schema;

namespace ZKEACMS.SectionWidget.Models
{
    [ViewConfigure(typeof(SectionContentCallToActionMetaData)), Table("SectionContentCallToAction")]
    public class SectionContentCallToAction : SectionContentBasic
    {
        public string InnerText { get; set; }
        public string Href { get; set; }
        public override int SectionContentType
        {
            get
            {
                return (int)Types.CallToAction;
            }
        }
    }

    class SectionContentCallToActionMetaData : ViewMetaData<SectionContentCallToAction>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.InnerText).AsTextBox().Required();
            ViewConfig(m => m.Href).AsTextBox().Required().AddClass("select").AddProperty("data-url", Urls.SelectPage);
            ViewConfig(m => m.ID).AsHidden();
            ViewConfig(m => m.Title).AsHidden();
            ViewConfig(m => m.SectionContentType).AsHidden();
            ViewConfig(m => m.Order).AsHidden();
            ViewConfig(m => m.SectionGroupId).AsHidden();
            ViewConfig(m => m.SectionWidgetId).AsHidden();
            ViewConfig(m => m.Status).AsHidden();
            ViewConfig(m => m.Description).AsHidden();
        }
    }
}