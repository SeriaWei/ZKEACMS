/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Constant;
using Easy.MetaData;
using Easy.RepositoryPattern;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using ZKEACMS.Extend;
using ZKEACMS.MetaData;
using ZKEACMS.Widget;

namespace ZKEACMS.Article.Models
{
    [DataTable("ArticleSummaryWidget")]
    public class ArticleSummaryWidget : BasicWidget
    {
        public string SubTitle { get; set; }
        public string DetailLink { get; set; }
        public string Summary { get; set; }
        public string Style { get; set; }
    }
    class ArticleSummaryWidgetMetaData : WidgetMetaData<ArticleSummaryWidget>
    {
        protected override void ViewConfigure()
        {
            base.ViewConfigure();
            ViewConfig(m => m.SubTitle).AsTextBox().Order(NextOrder());
            ViewConfig(m => m.Style).AsDropDownList().Order(NextOrder()).DataSource(SourceType.Dictionary);
            ViewConfig(m => m.DetailLink).AsTextBox().Order(NextOrder()).PageSelector();
            ViewConfig(m => m.Summary).AsTextArea().Order(NextOrder()).AddClass("html");
            ViewConfig(m => m.PartialView).AsDropDownList().Order(NextOrder()).DataSource(SourceType.Dictionary);
        }
    }

}