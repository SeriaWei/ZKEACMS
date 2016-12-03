/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.Linq;
using Easy.MetaData;
using Easy.Web.CMS.Article.Service;
using Easy.Web.CMS.MetaData;
using Easy.Web.CMS.Widget;
using Microsoft.Practices.ServiceLocation;

namespace ZKEACMS.Article.Models
{
    [DataConfigure(typeof(ArticleTypeWidgetMetaData)), Serializable]
    public class ArticleTypeWidget : WidgetBase
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
                return ServiceLocator.Current.GetInstance<IArticleTypeService>().Get().ToDictionary(m => m.ID.ToString(), m => m.Title);
            }).Required();
            ViewConfig(m => m.TargetPage).AsHidden();
        }
    }
}