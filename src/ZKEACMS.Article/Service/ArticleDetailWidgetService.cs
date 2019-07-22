/* http://www.zkea.net/ 
 * Copyright 2016 ZKEASOFT 
 * http://www.zkea.net/licenses 
 */
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
using System.Collections.Concurrent;
using Easy.Cache;

namespace ZKEACMS.Article.Service
{
    public class ArticleDetailWidgetService : WidgetService<ArticleDetailWidget>
    {
        private const string ArticleDetailWidgetRelatedPageUrls = "ArticleDetailWidgetRelatedPageUrls";
        private readonly IArticleService _articleService;
        private readonly ConcurrentDictionary<string, object> _allRelatedUrlCache;
        public ArticleDetailWidgetService(IWidgetBasePartService widgetService,
            IArticleService articleService,
            IApplicationContext applicationContext,
            ICacheManager<ConcurrentDictionary<string, object>> cacheManager,
            CMSDbContext dbContext)
            : base(widgetService, applicationContext, dbContext)
        {
            _articleService = articleService;
            _allRelatedUrlCache = cacheManager.GetOrAdd(ArticleDetailWidgetRelatedPageUrls, new ConcurrentDictionary<string, object>());
        }
        private void DismissRelatedPageUrls()
        {
            _allRelatedUrlCache.TryRemove(ArticleDetailWidgetRelatedPageUrls, out var urls);
        }

        public override void AddWidget(WidgetBase widget)
        {
            base.AddWidget(widget);
            DismissRelatedPageUrls();
        }

        public override void DeleteWidget(string widgetId)
        {
            base.DeleteWidget(widgetId);
            DismissRelatedPageUrls();
        }

        public override WidgetViewModelPart Display(WidgetBase widget, ActionContext actionContext)
        {
            int articleId = actionContext.RouteData.GetPost();
            var viewModel = new ArticleDetailViewModel();
            if (articleId != 0)
            {
                viewModel.Current = actionContext.RouteData.GetArticle(articleId) ?? _articleService.Get(articleId);
                if (viewModel.Current != null)
                {
                    _articleService.IncreaseCount(viewModel.Current);
                    viewModel.Prev = _articleService.GetPrev(viewModel.Current);
                    viewModel.Next = _articleService.GetNext(viewModel.Current);
                    if (viewModel.Current.Url.IsNotNullAndWhiteSpace() && actionContext.RouteData.GetArticleUrl().IsNullOrWhiteSpace())
                    {
                        actionContext.RedirectTo($"{actionContext.RouteData.GetPath()}/{viewModel.Current.Url}.html", true);
                    }
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

        public string[] GetRelatedPageUrls()
        {
            return _allRelatedUrlCache.GetOrAdd(ArticleDetailWidgetRelatedPageUrls, fac =>
            {
                var pages = WidgetBasePartService.Get(w => Get().Select(m => m.ID).Contains(w.ID)).Select(m => m.PageID).ToArray();
                return DbContext.Page.Where(p => pages.Contains(p.ID)).Select(m => m.Url.Replace("~/", "/")).Distinct().ToArray();
            }) as string[];
        }
    }
}