/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy;
using Easy.RepositoryPattern;
using Microsoft.AspNetCore.Http;
using ZKEACMS.Article.Models;
using ZKEACMS.Article.ViewModel;
using ZKEACMS.Widget;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using System;
using Microsoft.AspNetCore.Mvc;

namespace ZKEACMS.Article.Service
{
    public class ArticleTopWidgetService : WidgetService<ArticleTopWidget>
    {
        private readonly IArticleService _articleService;
        private readonly IArticleTypeService _articleTypeService;
        public ArticleTopWidgetService(IWidgetBasePartService widgetService,
            IArticleService articleService,
            IApplicationContext applicationContext,
            IArticleTypeService articleTypeService,
            CMSDbContext dbContext) : base(widgetService, applicationContext, dbContext)
        {
            _articleService = articleService;
            _articleTypeService = articleTypeService;
        }

        public override WidgetViewModelPart Display(WidgetBase widget, ActionContext actionContext)
        {
            var currentWidget = widget as ArticleTopWidget;
            var viewModel = new ArticleTopWidgetViewModel
            {
                Widget = currentWidget
            };
            var categoryIds = _articleTypeService.Get(m => m.ID == currentWidget.ArticleTypeID || m.ParentID == currentWidget.ArticleTypeID).Select(m => m.ID);
            viewModel.Articles = _articleService.Get(m => m.IsPublish && categoryIds.Contains(m.ArticleTypeID ?? 0)).OrderByDescending(m => m.PublishDate).Take(currentWidget.Tops ?? 10);
            return widget.ToWidgetViewModelPart(viewModel);
        }
    }
}