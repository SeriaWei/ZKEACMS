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
    public class ArticleListWidgetService : WidgetService<ArticleListWidget>
    {
        public override WidgetPart Display(WidgetBase widget, HttpContextBase httpContext)
        {
            var currentWidget = widget as ArticleListWidget;
            var articleTypeService = ServiceLocator.Current.GetInstance<IArticleTypeService>();
            var categoryEntity = articleTypeService.Get(currentWidget.ArticleTypeID);
            int pageIndex = 0;
            int ac = 0;
            int.TryParse(httpContext.Request.QueryString["ac"], out ac);
            int.TryParse(httpContext.Request.QueryString["p"], out pageIndex);
            var filter = new DataFilter();
            filter.Where("IsPublish", OperatorType.Equal, true);
            filter.OrderBy("CreateDate", OrderType.Descending);
            var articleService = ServiceLocator.Current.GetInstance<IArticleService>();
            var page = new Pagination { PageIndex = pageIndex, PageSize = currentWidget.PageSize ?? 20 };
            if (ac != 0)
            {
                filter.Where("ArticleTypeID", OperatorType.Equal, ac);
            }
            else
            {
                filter.Where("ArticleTypeID", OperatorType.Equal, currentWidget.ArticleTypeID);
            }
            return widget.ToWidgetPart(new ArticleListWidgetViewModel
            {
                Articles = currentWidget.IsPageable ? articleService.Get(filter, page) : articleService.Get(filter),
                Widget = currentWidget,
                Pagin = page,
                CategoryTitle = categoryEntity == null ? "" : categoryEntity.Title,
                IsPageable = currentWidget.IsPageable
            });
        }
    }
}