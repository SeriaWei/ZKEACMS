/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

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
using Easy.Constant;
using ZKEACMS.StructuredData;
using Easy.Serializer;
using System.Collections.Generic;
using Microsoft.AspNetCore.Html;
using Microsoft.Extensions.Caching.Memory;

namespace ZKEACMS.Article.Service
{
    public class ArticleDetailWidgetService : WidgetService<ArticleDetailWidget>
    {
        private const string ArticleDetailWidgetRelatedPageUrls = "ArticleDetailWidgetRelatedPageUrls";
        private readonly IArticleService _articleService;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly ICacheManager<ArticleDetailWidgetService> _cacheManager;
        private readonly ISignals _signals;
        public ArticleDetailWidgetService(IWidgetBasePartService widgetService,
            IArticleService articleService,
            IApplicationContext applicationContext,
            ICacheManager<ArticleDetailWidgetService> cacheManager,
            CMSDbContext dbContext,
            IHttpContextAccessor contextAccessor,
            ISignals signals)
            : base(widgetService, applicationContext, dbContext)
        {
            _articleService = articleService;
            _cacheManager = cacheManager;
            _httpContextAccessor = contextAccessor;
            _signals = signals;
        }
        private void DismissRelatedPageUrls()
        {
            _cacheManager.Remove(ArticleDetailWidgetRelatedPageUrls);
        }

        public override ErrorOr<ArticleDetailWidget> Add(ArticleDetailWidget item)
        {
            var result = base.Add(item);
            DismissRelatedPageUrls();
            return result;
        }
        public override ErrorOr<ArticleDetailWidget> Update(ArticleDetailWidget item)
        {
            var result = base.Update(item);
            DismissRelatedPageUrls();
            return result;
        }
        public override void DeleteWidget(string widgetId)
        {
            base.DeleteWidget(widgetId);
            DismissRelatedPageUrls();
        }

        public override object Display(WidgetDisplayContext widgetDisplayContext)
        {
            var actionContext = widgetDisplayContext.ActionContext;
            int articleId = actionContext.RouteData.GetPost();
            var viewModel = new ArticleDetailViewModel();
            if (articleId != 0)
            {
                viewModel.Current = actionContext.RouteData.GetArticle(articleId) ?? _articleService.Get(articleId);
                if (viewModel.Current != null)
                {
                    if (!viewModel.Current.IsPublish || viewModel.Current.Status != (int)RecordStatus.Active)
                    {
                        actionContext.NotFoundResult();
                        return null;
                    }
                    _articleService.IncreaseCount(viewModel.Current);
                    viewModel.Prev = _articleService.GetPrev(viewModel.Current);
                    viewModel.Next = _articleService.GetNext(viewModel.Current);
                    if (viewModel.Current.Url.IsNotNullAndWhiteSpace() && actionContext.RouteData.GetArticleUrl().IsNullOrWhiteSpace())
                    {
                        actionContext.RedirectTo($"{actionContext.RouteData.GetPath()}/{viewModel.Current.Url}.html", true);
                        return null;
                    }
                }
            }
            else
            {
                var latest = _articleService.GetLatestPublished();
                if (ApplicationContext.Current().IsDesignMode || ApplicationContext.Current().IsPreViewMode)
                {
                    viewModel.Current = latest;
                }
                else
                {
                    actionContext.RedirectTo($"{actionContext.RouteData.GetPath()}/{latest.Url}.html", false);
                    return null;
                }
            }

            if (viewModel.Current == null)
            {
                actionContext.NotFoundResult();
                return null;
            }

            ApplicationContext.Current().CurrentPage.ConfigSEO(viewModel.Current.Title, viewModel.Current.MetaKeyWords, viewModel.Current.MetaDescription);
            AddStructuredDataToPageHeader(viewModel.Current);
            return viewModel;
        }
        private void AddStructuredDataToPageHeader(ArticleEntity article)
        {
            var structuredData = new NewsArticle
            {
                HeadLine = article.Title,
                Image = GetImages(article).Where(m => m.IsNotNullAndWhiteSpace()).ToArray(),
                DatePublished = article.PublishDate,
                DateModified = article.LastUpdateDate,
                Author = new Person[] { new Person { Name = article.CreatebyName } }
            };
            ApplicationContext.Current().CurrentPage.HeaderScripts.Add(new Page.ScriptTag()
            {
                Type = "application/ld+json",
                InnerScript = new HtmlString(JsonConverter.Serialize(structuredData))
            });
        }
        private IEnumerable<string> GetImages(ArticleEntity article)
        {
            yield return ToFullImageUrl(article.ImageUrl);
            yield return ToFullImageUrl(article.ImageThumbUrl);

            foreach (var item in HtmlHelper.ParseImageUrls(article.ArticleContent))
            {
                yield return ToFullImageUrl(item);
            }
        }

        private string ToFullImageUrl(string url)
        {
            if (url.IsNullOrEmpty() ||
                url.StartsWith("http://", StringComparison.OrdinalIgnoreCase) ||
                url.StartsWith("https://", StringComparison.OrdinalIgnoreCase)) return url;

            return _httpContextAccessor.HttpContext.GetUrlWithHost(url);
        }

        public string[] GetRelatedPageUrls()
        {
            return _cacheManager.GetOrCreate(ArticleDetailWidgetRelatedPageUrls, factory =>
            {
                factory.AddExpirationToken(_signals.When(CacheSignals.PageUrlChanged));

                var pages = WidgetBasePartService.Get(w => Get().Select(m => m.ID).Contains(w.ID)).Select(m => m.PageId).ToArray();
                return DbContext.Page.Where(p => pages.Contains(p.ID)).Select(m => m.Url.Replace("~/", "/")).Distinct().ToArray();
            });
        }
    }
}