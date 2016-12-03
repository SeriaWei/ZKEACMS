/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Web;
using ZKEACMS.Article.Models;
using ZKEACMS.Article.ViewModel;
using Easy.Data;
using Easy.Web.CMS.Article.Service;
using Easy.Web.CMS.Widget;
using Microsoft.Practices.ServiceLocation;

namespace ZKEACMS.Article.Service
{
    public class ArticleTopWidgetService : WidgetService<ArticleTopWidget>
    {
        public override WidgetPart Display(WidgetBase widget, HttpContextBase httpContext)
        {
            var currentWidget = widget as ArticleTopWidget;
            var page = new Pagination
            {
                PageIndex = 0,
                PageSize = currentWidget.Tops ?? 20
            };
            var viewModel = new ArticleTopWidgetViewModel
            {
                Widget = currentWidget
            };
            var filter = new DataFilter();
            filter.Where("IsPublish", OperatorType.Equal, true);
            filter.OrderBy("PublishDate", OrderType.Descending);
            filter.Where("ArticleTypeID", OperatorType.Equal, currentWidget.ArticleTypeID);
            viewModel.Articles = ServiceLocator.Current.GetInstance<IArticleService>().Get(filter, page);
            return widget.ToWidgetPart(viewModel);
        }
    }
}