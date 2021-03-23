using System;
using Easy;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Article.Models;
using ZKEACMS.Article.ViewModel;
using ZKEACMS.Widget;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using Easy.Extend;

namespace ZKEACMS.Article.Service
{
    public class ArticleSpecialDetailWidgetService : SimpleWidgetService<ArticleSpecialDetailWidget>
    {
        private readonly IArticleService _articleService;
        public ArticleSpecialDetailWidgetService(IWidgetBasePartService widgetService, IArticleService articleService, IApplicationContext applicationContext, CMSDbContext dbContext)
            : base(widgetService, applicationContext, dbContext)
        {
            _articleService = articleService;
        }

        public override object Display(WidgetDisplayContext widgetDisplayContext)
        {
            var viewModel = new ArticleDetailViewModel();
            var articleWidget = widgetDisplayContext.Widget as ArticleSpecialDetailWidget;
            ArticleEntity article = null;
            int articleId = articleWidget.ArticleId ?? 0;
            if (articleId > 0)
            {
                article = _articleService.Get(articleId);
            }
            else if (articleWidget.ArticleName.IsNotNullAndWhiteSpace())
            {
                article = _articleService.GetByUrl(articleWidget.ArticleName);
            }
            if (article == null)
            {
                widgetDisplayContext.ActionContext.NotFoundResult();
            }
            else
            {
                _articleService.IncreaseCount(article);
                var layout = widgetDisplayContext.PageLayout;
                if (layout != null && layout.Page != null)
                {
                    layout.Page.MetaKeyWorlds = article.MetaKeyWords;
                    layout.Page.MetaDescription = article.MetaDescription;
                    layout.Page.Title = article.Title;
                }
            }
            viewModel.Current = article;

            return viewModel;
        }
    }
}
