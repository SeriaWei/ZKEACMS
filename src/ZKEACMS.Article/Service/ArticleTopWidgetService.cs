/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy;
using Easy.RepositoryPattern;
using Microsoft.AspNetCore.Http;
using ZKEACMS.Article.Models;
using ZKEACMS.Article.ViewModel;
using ZKEACMS.Widget;
using System.Linq;

namespace ZKEACMS.Article.Service
{
    public class ArticleTopWidgetService : WidgetService<ArticleTopWidget>
    {
        private readonly IArticleService _articleService;
        public ArticleTopWidgetService(IWidgetService widgetService,IArticleService articleService, IApplicationContext applicationContext) : base(widgetService, applicationContext)
        {
            _articleService = articleService;
        }

        public override WidgetPart Display(WidgetBase widget, HttpContext httpContext)
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

            viewModel.Articles = _articleService.Get(m => m.IsPublish && m.ArticleTypeID == currentWidget.ArticleTypeID).OrderByDescending(m => m.PublishDate);
            return widget.ToWidgetPart(viewModel);
        }
    }
}