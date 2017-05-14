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

namespace ZKEACMS.Article.Service
{
    public class ArticleListWidgetService : WidgetService<ArticleListWidget, ArticleDbContext>
    {
        private readonly IArticleTypeService _articleTypeService;
        private readonly IArticleService _articleService;
        public ArticleListWidgetService(IWidgetBasePartService widgetService, IArticleTypeService articleTypeService,
            IArticleService articleService, IApplicationContext applicationContext)
            : base(widgetService, applicationContext)
        {
            _articleTypeService = articleTypeService;
            _articleService = articleService;
        }

        public override DbSet<ArticleListWidget> CurrentDbSet
        {
            get
            {
                return DbContext.ArticleListWidget;
            }
        }

        public override WidgetViewModelPart Display(WidgetBase widget, ActionContext actionContext)
        {
            var currentWidget = widget as ArticleListWidget;
            var categoryEntity = _articleTypeService.Get(currentWidget.ArticleTypeID);
            int pageIndex = actionContext.RouteData.GetPage();
            int cate = actionContext.RouteData.GetCategory();
            var page = new Pagination { PageIndex = pageIndex, PageSize = currentWidget.PageSize ?? 20 };
            IEnumerable<ArticleEntity> articles;

            Expression<Func<ArticleEntity, bool>> filter = null;
            if (cate != 0)
            {
                filter = m => m.IsPublish && m.ArticleTypeID == cate;
            }
            else
            {
                var ids = _articleTypeService.Get(m =>m.ID==currentWidget.ArticleTypeID || m.ParentID == currentWidget.ArticleTypeID).Select(m => m.ID);
                if (ids.Any())
                {
                    filter = m => m.IsPublish && ids.Any(id => id == m.ArticleTypeID);
                }
                else
                {
                    filter = m => m.IsPublish && m.ArticleTypeID == currentWidget.ArticleTypeID;
                }

            }
            if (currentWidget.IsPageable)
            {
                page.RecordCount = _articleService.Count(filter);
                articles = _articleService.Get(filter).OrderByDescending(m => m.ID).Skip(page.PageIndex * page.PageSize).Take(page.PageSize); ;
            }
            else
            {
                articles = _articleService.Get(filter).OrderByDescending(m => m.ID);
            }


            return widget.ToWidgetViewModelPart(new ArticleListWidgetViewModel
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