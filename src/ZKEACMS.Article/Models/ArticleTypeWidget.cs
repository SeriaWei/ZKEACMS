/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy;
using Easy.Constant;
using Easy.MetaData;
using Easy.RepositoryPattern;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using ZKEACMS.Article.Service;
using ZKEACMS.MetaData;
using ZKEACMS.Widget;

namespace ZKEACMS.Article.Models
{
    [DataTable("ArticleTypeWidget")]
    public class ArticleTypeWidget : BasicWidget
    {
        public int ArticleTypeID { get; set; }
        public string TargetPage { get; set; }
    }
    class ArticleTypeWidgetMetaData : WidgetMetaData<ArticleTypeWidget>
    {
        protected override void ViewConfigure()
        {
            base.ViewConfigure();
            ViewConfig(m => m.ArticleTypeID).AsDropDownList().Order(NextOrder()).SetTemplate("ArticleTypeTree").Required();
            ViewConfig(m => m.PartialView).AsDropDownList().Order(NextOrder()).DataSource(SourceType.Dictionary).Required();
            ViewConfig(m => m.TargetPage).AsHidden();
        }
    }
}