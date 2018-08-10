/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Article.Models;
using ZKEACMS.Article.ViewModel;
using ZKEACMS.Widget;
using Microsoft.AspNetCore.Mvc;
using System.Linq;

namespace ZKEACMS.Article.Service
{
    public class ArticleDetailWidgetService : WidgetService<ArticleDetailWidget>
    {
        private readonly IArticleService _articleService;
        public ArticleDetailWidgetService(IWidgetBasePartService widgetService, IArticleService articleService, IApplicationContext applicationContext, CMSDbContext dbContext)
            : base(widgetService, applicationContext, dbContext)
        {
            _articleService = articleService;
        }


        public override WidgetViewModelPart Display(WidgetBase widget, ActionContext actionContext)
        {
            int articleId = actionContext.RouteData.GetPost();
            var viewModel = new ArticleDetailViewModel();
            if (articleId != 0 || actionContext.RouteData.Values.ContainsKey("ArticleUrl"))
            {
                viewModel.Current = articleId != 0 ? _articleService.Get(articleId) : _articleService.GetByUrl(actionContext.RouteData.Values["ArticleUrl"].ToString());
                if (viewModel.Current != null)
                {
                    _articleService.IncreaseCount(viewModel.Current);
                    viewModel.Prev = _articleService.GetPrev(viewModel.Current);
                    viewModel.Next = _articleService.GetNext(viewModel.Current);
                }
            }
            if (viewModel.Current == null && ApplicationContext.IsAuthenticated)
            {
                foreach (var item in _articleService.Get().AsQueryable().OrderByDescending(m => m.ID).Take(1))
                {
                    viewModel.Current = item;
                }
            }
            if (viewModel.Current == null)
            {
                actionContext.NotFoundResult();
            }
            else
            {
                var layout = actionContext.HttpContext.GetLayout();
                if (layout != null && layout.Page != null)
                {
                    layout.Page.MetaKeyWorlds = viewModel.Current.MetaKeyWords;
                    layout.Page.MetaDescription = viewModel.Current.MetaDescription;
                    layout.Page.Title = viewModel.Current.Title;
                }
            }


            return widget.ToWidgetViewModelPart(viewModel);
        }
    }
}