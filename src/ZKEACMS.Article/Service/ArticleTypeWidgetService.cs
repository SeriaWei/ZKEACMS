/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Web;
using ZKEACMS.Article.Models;
using ZKEACMS.Article.ViewModel;
using Easy.Data;
using Easy.Extend;
using Easy.Web.CMS.Article.Service;
using Easy.Web.CMS.Widget;
using Microsoft.Practices.ServiceLocation;

namespace ZKEACMS.Article.Service
{
    public class ArticleTypeWidgetService : WidgetService<ArticleTypeWidget>
    {
        public override WidgetPart Display(WidgetBase widget, HttpContextBase httpContext)
        {
            ArticleTypeWidget currentWidget = widget as ArticleTypeWidget;
            var service = ServiceLocator.Current.GetInstance<IArticleTypeService>();
            var filter = new DataFilter().Where("ParentID", OperatorType.Equal, currentWidget.ArticleTypeID);
            int ac = 0;
            int.TryParse(httpContext.Request.QueryString["ac"], out ac);
            return widget.ToWidgetPart(new ArticleTypeWidgetViewModel
            {
                ArticleTypes = service.Get(filter),
                CurrentType = service.Get(currentWidget.ArticleTypeID),
                TargetPage = currentWidget.TargetPage.IsNullOrEmpty() ? httpContext.Request.Url.PathAndQuery.ToLower() : currentWidget.TargetPage,
                ArticleTypeID = ac
            });
        }
    }
}