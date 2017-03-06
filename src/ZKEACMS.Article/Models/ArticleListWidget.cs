/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy;
using Easy.Extend;
using Easy.MetaData;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.IO;
using System.Linq;
using ZKEACMS.Article.Service;
using ZKEACMS.MetaData;
using ZKEACMS.Widget;

namespace ZKEACMS.Article.Models
{
    [ViewConfigure(typeof(ArticleListWidgetMeta)), Table("ArticleListWidget")]
    public class ArticleListWidget : BasicWidget
    {
        public int ArticleTypeID { get; set; }
        public string DetailPageUrl { get; set; }
        public bool IsPageable { get; set; }
        public int? PageSize { get; set; }
    }
    class ArticleListWidgetMeta : WidgetMetaData<ArticleListWidget>
    {
        protected override void ViewConfigure()
        {
            base.ViewConfigure();
            var articleTypeService = new ServiceLocator().GetService<IArticleTypeService>();
            ViewConfig(m => m.ArticleTypeID).AsDropDownList().Order(NextOrder()).DataSource(() => articleTypeService.GetAll().ToDictionary(m => m.ID.ToString(), m => m.Title)).Required();
            ViewConfig(m => m.DetailPageUrl).AsTextBox().Order(NextOrder()).AddClass("select").AddProperty("data-url", Urls.SelectPage);

            ViewConfig(m => m.PartialView).AsDropDownList().Order(NextOrder()).DataSource(() =>
            {
                Dictionary<string, string> templates = new Dictionary<string, string>();
                templates.Add("Widget.ArticleList", "Ä¬ÈÏ");
                templates.Add("Widget.ArticleList-Snippet", "ºá·ù");
                return templates;
            });
        }
    }

}