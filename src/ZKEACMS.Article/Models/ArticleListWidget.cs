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
                var path = (new ServiceLocator().GetService<IApplicationContext>() as CMSApplicationContext).MapPath("~/Modules/Article/Views");
                Dictionary<string, string> templates = new Dictionary<string, string>();
                Directory.GetFiles(path, "Widget.ArticleList*.cshtml").Each(f =>
                {
                    string fileName = Path.GetFileNameWithoutExtension(f);
                    templates.Add(fileName, fileName.Replace("Widget.", ""));

                });
                return templates;
            });
        }
    }

}