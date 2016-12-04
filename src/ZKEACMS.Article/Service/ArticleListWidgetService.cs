/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy;
using Easy.RepositoryPattern;
using Microsoft.AspNetCore.Http;
using ZKEACMS.Article.Models;
using ZKEACMS.Article.ViewModel;
using ZKEACMS.Widget;
using System.Collections.Generic;
using System.Linq;

namespace ZKEACMS.Article.Service
{
    public class ArticleListWidgetService : WidgetService<ArticleListWidget>
    {
        private readonly IArticleTypeService _articleTypeService;
        private readonly IArticleService _articleService;
        public ArticleListWidgetService(IWidgetService widgetService, IArticleTypeService articleTypeService,
            IArticleService articleService, IApplicationContext applicationContext)
            : base(widgetService, applicationContext)
        {
            _articleTypeService = articleTypeService;
            _articleService = articleService;
        }

        public override WidgetPart Display(WidgetBase widget, HttpContext httpContext)
        {
            var currentWidget = widget as ArticleListWidget;
            var categoryEntity = _articleTypeService.Get(currentWidget.ArticleTypeID);
            int pageIndex = 0;
            int ac = 0;
            int.TryParse(httpContext.Request.Query["ac"], out ac);
            int.TryParse(httpContext.Request.Query["p"], out pageIndex);
            var page = new Pagination { PageIndex = pageIndex, PageSize = currentWidget.PageSize ?? 20 };
            IEnumerable<ArticleEntity> articles;
            if (currentWidget.IsPageable)
            {

                articles = _articleService.Get(m => m.IsPublish == true, page);
            }
            else
            {
                articles = _articleService.Get(m => m.IsPublish == true);
            }

            if (ac != 0)
            {
                articles = articles.Where(m => m.ArticleTypeID == ac);
            }
            else
            {
                articles = articles.Where(m => m.ArticleTypeID == currentWidget.ArticleTypeID);
            }
            return widget.ToWidgetPart(new ArticleListWidgetViewModel
            {
                Articles = articles,
                Widget = currentWidget,
                Pagin = page,
                CategoryTitle = categoryEntity == null ? "" : categoryEntity.Title,
                IsPageable = currentWidget.IsPageable
            });
        }
    }
}