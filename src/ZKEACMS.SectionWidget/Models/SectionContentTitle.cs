/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using Easy.MetaData;
using System.ComponentModel.DataAnnotations.Schema;
using ZKEACMS.Extend;
using Easy.RepositoryPattern;

namespace ZKEACMS.SectionWidget.Models
{
    [DataTable("SectionContentTitle")]
    public class SectionContentTitle : SectionContentBasic
    {
        public const string H1 = "h1";
        public const string H2 = "h2";
        public const string H3 = "h3";
        public const string H4 = "h4";
        public const string H5 = "h5";
        public const string H6 = "h6";
        public string InnerText { get; set; }
        public string Href { get; set; }
        public string TitleLevel { get; set; }
        [NotMapped]
        public override int SectionContentType
        {
            get
            {
                return (int)Types.Title;
            }
        }
    }

    class SectionContentTitleMetaData : ViewMetaData<SectionContentTitle>
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
            ViewConfig(m => m.InnerText).AsTextBox().Required();
            ViewConfig(m => m.Href).AsTextBox().PageSelector();
            ViewConfig(m => m.TitleLevel).AsDropDownList().DataSource(() => new Dictionary<string, string>
            {
                {SectionContentTitle.H1,"一级标题"},
                {SectionContentTitle.H2,"二级标题"},
                {SectionContentTitle.H3,"三级标题"},
                {SectionContentTitle.H4,"四级标题"},
                {SectionContentTitle.H5,"五级标题"},
                {SectionContentTitle.H6,"六级标题"}
            });
        }
    }
}