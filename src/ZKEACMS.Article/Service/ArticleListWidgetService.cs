/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy;
using Easy.RepositoryPattern;
using Microsoft.AspNetCore.Http;
using ZKEACMS.Article.Models;
using ZKEACMS.Article.ViewModel;
using ZKEACMS.Widget;
using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using System;
using Microsoft.AspNetCore.Mvc;
using System.Linq.Expressions;
using ZKEACMS.Page;
using Easy.Extend;

namespace ZKEACMS.Article.Service
{
    public class ArticleListWidgetService : WidgetService<ArticleListWidget>
    {
        private readonly IArticleTypeService _articleTypeService;
        private readonly IArticleService _articleService;
        private readonly IPageService _pageService;
        public ArticleListWidgetService(IWidgetBasePartService widgetService, IArticleTypeService articleTypeService,
            IArticleService articleService, IApplicationContext applicationContext, IPageService pageService, CMSDbContext dbContext)
            : base(widgetService, applicationContext, dbContext)
        {
            _articleTypeService = articleTypeService;
            _articleService = articleService;
            _pageService = pageService;
        }

        private string GetDetailPageUrl()
        {
            var baseDetail = WidgetBasePartService.Get(m => m.ServiceTypeName == "ZKEACMS.Article.Service.ArticleDetailWidgetService").FirstOrDefault();
            if (baseDetail != null)
            {
                var page = _pageService.Get(baseDetail.PageID);
                if (page != null)
                {
                    return page.Url;
                }
            }
            return "~/article-detail";
        }

        public override ServiceResult<ArticleListWidget> Add(ArticleListWidget item)
        {
            if (item.DetailPageUrl.IsNullOrEmpty())
            {
                item.DetailPageUrl = GetDetailPageUrl();
            }
            return base.Add(item);
        }

        public override ArticleListWidget Get(params object[] primaryKeys)
        {
            var widget = base.Get(primaryKeys);
            if (widget.DetailPageUrl.IsNullOrEmpty())
            {
                widget.DetailPageUrl = GetDetailPageUrl();
                Update(widget);
            }
            return widget;
        }

        public override WidgetViewModelPart Display(WidgetBase widget, ActionContext actionContext)
        {
            var currentWidget = widget as ArticleListWidget;
            var categoryEntity = _articleTypeService.Get(currentWidget.ArticleTypeID);
            int pageIndex = actionContext.RouteData.GetPage();
            int cate = actionContext.RouteData.GetCategory();
            var pagin = new Pagination
            {
                PageIndex = pageIndex,
                PageSize = currentWidget.PageSize ?? 20,
                OrderByDescending = "PublishDate"
            };
            IEnumerable<ArticleEntity> articles;

            Expression<Func<ArticleEntity, bool>> filter = null;
            if (cate != 0)
            {
                filter = m => m.IsPublish && m.ArticleTypeID == cate;
            }
            else
            {
                var ids = _articleTypeService.Get(m => m.ID == currentWidget.ArticleTypeID || m.ParentID == currentWidget.ArticleTypeID).Select(m => m.ID).ToList();
                if (ids.Any())
                {
                    filter = m => m.IsPublish && ids.Contains(m.ArticleTypeID ?? 0);
                }
                else
                {
                    filter = m => m.IsPublish && m.ArticleTypeID == currentWidget.ArticleTypeID;
                }

            }
            if (currentWidget.IsPageable)
            {
                articles = _articleService.Get(filter, pagin);
            }
            else
            {
                articles = _articleService.Get().Where(filter).OrderByDescending(m => m.PublishDate).ToList();
            }

            var currentArticleType = _articleTypeService.Get(cate == 0 ? currentWidget.ArticleTypeID : cate);
            if (currentArticleType != null)
            {
                var layout = actionContext.HttpContext.GetLayout();
                if (layout != null && layout.Page != null)
                {
                    var page = layout.Page;
                    //page.Title = (page.Title ?? "") + " - " + currentArticleType.Title;
                    page.Title = page.Title.IsNullOrWhiteSpace() ? currentArticleType.Title : $"{page.Title} - {currentArticleType.Title}";
                }
            }

            return widget.ToWidgetViewModelPart(new ArticleListWidgetViewModel
            {
                Articles = articles,
                Widget = currentWidget,
                Pagin = pagin,
                CategoryTitle = categoryEntity == null ? "" : categoryEntity.Title,
                IsPageable = currentWidget.IsPageable
            });
        }
    }
}