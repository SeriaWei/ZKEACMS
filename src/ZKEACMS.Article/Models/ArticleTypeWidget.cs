/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy;
using Easy.MetaData;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using ZKEACMS.Article.Service;
using ZKEACMS.MetaData;
using ZKEACMS.Widget;

namespace ZKEACMS.Article.Models
{
    [ViewConfigure(typeof(ArticleTypeWidgetMetaData)), Table("ArticleTypeWidget")]
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
            ViewConfig(m => m.ArticleTypeID).AsDropDownList().Order(NextOrder()).DataSource(() =>
            {
                return new ServiceLocator().GetService<IArticleTypeService>().GetAll().ToDictionary(m => m.ID.ToString(), m => m.Title);
            }).Required();
            ViewConfig(m => m.TargetPage).AsHidden();
        }
    }
}