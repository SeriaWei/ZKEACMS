/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy;
using Easy.Extend;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Article.Models;
using ZKEACMS.Article.ViewModel;
using ZKEACMS.Widget;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using System.Collections.Concurrent;
using Easy.Cache;

namespace ZKEACMS.Article.Service
{
    public class ArticleTypeWidgetService : WidgetService<ArticleTypeWidget>
    {
        private const string ArticleTypeWidgetRelatedPageUrls = "ArticleTypeWidgetRelatedPageUrls";
        private readonly ConcurrentDictionary<string, object> _allRelatedUrlCache;
        private readonly IArticleTypeService _articleTypeService;
        public ArticleTypeWidgetService(IWidgetBasePartService widgetService, 
            IArticleTypeService articleTypeService, 
            IApplicationContext applicationContext, 
            ICacheManager<ConcurrentDictionary<string, object>> cacheManager,
            CMSDbContext dbContext)
            : base(widgetService, applicationContext, dbContext)
        {
            _articleTypeService = articleTypeService;
            _allRelatedUrlCache = cacheManager.GetOrAdd(ArticleTypeWidgetRelatedPageUrls, new ConcurrentDictionary<string, object>());
        }
        private void DismissRelatedPageUrls()
        {
            _allRelatedUrlCache.TryRemove(ArticleTypeWidgetRelatedPageUrls, out var urls);
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
            ArticleTypeWidget currentWidget = widget as ArticleTypeWidget;
            var types = _articleTypeService.Get(m => m.ParentID == currentWidget.ArticleTypeID);
            int ac = actionContext.RouteData.GetCategory();
            ArticleType articleType = null;
            if (ac > 0)
            {
                articleType = _articleTypeService.Get(ac);
            }
            if (actionContext.RouteData.GetCategoryUrl().IsNullOrEmpty() && articleType != null)
            {
                if (articleType.Url.IsNotNullAndWhiteSpace())
                {
                    actionContext.RedirectTo($"{actionContext.RouteData.GetPath()}/{articleType.Url}", true);
                }
            }
            if (articleType != null)
            {
                var layout = actionContext.HttpContext.GetLayout();
                if (layout != null && layout.Page != null)
                {
                    layout.Page.Title = articleType.SEOTitle ?? articleType.Title;
                    layout.Page.MetaKeyWorlds = articleType.SEOKeyWord;
                    layout.Page.MetaDescription = articleType.SEODescription;
                }
            }
            return widget.ToWidgetViewModelPart(new ArticleTypeWidgetViewModel
            {
                ArticleTypes = types,
                ArticleTypeID = ac
            });
        }

        public string[] GetRelatedPageUrls()
        {
            return _allRelatedUrlCache.GetOrAdd(ArticleTypeWidgetRelatedPageUrls, fac =>
            {
                var pages = WidgetBasePartService.Get(w => Get().Select(m => m.ID).Contains(w.ID)).Select(m => m.PageID).ToArray();
                return DbContext.Page.Where(p => pages.Contains(p.ID)).Select(m => m.Url.Replace("~/", "/")).Distinct().ToArray();
            }) as string[];
        }
    }
}