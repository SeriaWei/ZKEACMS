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
    public class ArticleSpecialDetailWidgetService : WidgetService<ArticleSpecialDetailWidget>
    {
        private readonly IArticleService _articleService;
        public ArticleSpecialDetailWidgetService(IWidgetBasePartService widgetService, IArticleService articleService, IApplicationContext applicationContext, CMSDbContext dbContext)
            : base(widgetService, applicationContext, dbContext)
        {
            _articleService = articleService;
        }

        public override WidgetViewModelPart Display(WidgetBase widget, ActionContext actionContext)
        {
            var viewModel = new ArticleDetailViewModel();
            var articleWidget = GetSingle(m => m.ID == widget.ID);
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
                actionContext.NotFoundResult();
            }
            else
            {
                _articleService.IncreaseCount(article);
                var layout = actionContext.HttpContext.GetLayout();
                if (layout != null && layout.Page != null)
                {
                    layout.Page.MetaKeyWorlds = article.MetaKeyWords;
                    layout.Page.MetaDescription = article.MetaDescription;
                    layout.Page.Title = article.Title;
                }
            }
            viewModel.Current = article;

            return widget.ToWidgetViewModelPart(viewModel);
        }
    }
}
