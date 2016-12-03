/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Easy.Constant;
using Easy.Extend;
using Easy.MetaData;
using Easy.Web.CMS;
using Easy.Web.CMS.Article.Service;
using Easy.Web.CMS.MetaData;
using Easy.Web.CMS.Widget;
using Microsoft.Practices.ServiceLocation;

namespace ZKEACMS.Article.Models
{
    [DataConfigure(typeof(ArticleTopWidgetMetaData)), Serializable]
    public class ArticleTopWidget : WidgetBase
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
            var articleTypeService = ServiceLocator.Current.GetInstance<IArticleTypeService>();
            ViewConfig(m => m.ArticleTypeID).AsDropDownList().Order(NextOrder()).DataSource(articleTypeService.Get().ToDictionary(m => m.ID.ToString(), m => m.Title)).Required();
            ViewConfig(m => m.Tops).AsTextBox().Order(NextOrder()).RegularExpression(RegularExpression.PositiveIntegers);
            ViewConfig(m => m.MoreLink).AsTextBox().Order(NextOrder()).AddClass("select").AddProperty("data-url", Urls.SelectPage);
            ViewConfig(m => m.DetailPageUrl).AsTextBox().Order(NextOrder()).AddClass("select").AddProperty("data-url", Urls.SelectPage);

            ViewConfig(m => m.PartialView).AsDropDownList().Order(NextOrder()).DataSource(() =>
            {
                var path = (ServiceLocator.Current.GetInstance<IApplicationContext>() as CMSApplicationContext).MapPath("~/Modules/Article/Views");
                Dictionary<string, string> templates = new Dictionary<string, string>();
                Directory.GetFiles(path, "Widget.ArticleTops*.cshtml").Each(f =>
                {
                    string fileName = Path.GetFileNameWithoutExtension(f);
                    templates.Add(fileName, fileName.Replace("Widget.", ""));

                });
                return templates;
            });
        }
    }

}