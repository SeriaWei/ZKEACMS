/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy;
using Easy.Constant;
using Easy.Extend;
using Easy.MetaData;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.IO;
using System.Linq;
using ZKEACMS.Article.Service;
using ZKEACMS.Extend;
using ZKEACMS.MetaData;
using ZKEACMS.Widget;

namespace ZKEACMS.Article.Models
{
    [ViewConfigure(typeof(ArticleTopWidgetMetaData)), Table("ArticleTopWidget")]
    public class ArticleTopWidget : BasicWidget
    {
        public int ArticleTypeID { get; set; }
        public int? Tops { get; set; }
        public string SubTitle { get; set; }
        public string MoreLink { get; set; }
        public string DetailPageUrl { get; set; }
    }
    class ArticleTopWidgetMetaData : WidgetMetaData<ArticleTopWidget>
    {
        protected override void ViewConfigure()
        {
            base.ViewConfigure();
            ViewConfig(m => m.SubTitle).AsTextBox().Order(NextOrder());
            ViewConfig(m => m.ArticleTypeID).AsDropDownList().Order(NextOrder()).DataSource(() =>
            {
                var articleTypeService = ServiceLocator.GetService<IArticleTypeService>();
                return articleTypeService.GetAll().ToDictionary(m => m.ID.ToString(), m => m.Title);
            }).Required().AddClass("select").AddProperty("data-url", "/admin/ArticleType/Select");

            ViewConfig(m => m.Tops).AsTextBox().Order(NextOrder()).RegularExpression(RegularExpression.PositiveIntegers).Required();
            ViewConfig(m => m.MoreLink).AsTextBox().Order(NextOrder()).PageSelector();
            ViewConfig(m => m.DetailPageUrl).AsTextBox().Order(NextOrder()).PageSelector();

            ViewConfig(m => m.PartialView).AsDropDownList().Order(NextOrder()).DataSource(SourceType.Dictionary);
        }
    }

}