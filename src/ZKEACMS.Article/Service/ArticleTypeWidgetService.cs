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

namespace ZKEACMS.Article.Service
{
    public class ArticleTypeWidgetService : WidgetService<ArticleTypeWidget, ArticleDbContext>
    {
        private readonly IArticleTypeService _articleTypeService;
        public ArticleTypeWidgetService(IWidgetBasePartService widgetService, IArticleTypeService articleTypeService, IApplicationContext applicationContext) : base(widgetService, applicationContext)
        {
            _articleTypeService = articleTypeService;
        }

        public override DbSet<ArticleTypeWidget> CurrentDbSet
        {
            get
            {
                return DbContext.ArticleTypeWidget;
            }
        }

        public override WidgetViewModelPart Display(WidgetBase widget, ActionContext actionContext)
        {
            ArticleTypeWidget currentWidget = widget as ArticleTypeWidget;
            var types = _articleTypeService.Get(m => m.ParentID == currentWidget.ArticleTypeID);
            int ac = actionContext.RouteData.GetCategory();
            return widget.ToWidgetViewModelPart(new ArticleTypeWidgetViewModel
            {
                ArticleTypes = types,
                CurrentType = _articleTypeService.Get(currentWidget.ArticleTypeID),
                TargetPage = currentWidget.TargetPage.IsNullOrEmpty() ? actionContext.HttpContext.Request.Path.ToString().ToLower() : currentWidget.TargetPage,
                ArticleTypeID = ac
            });
        }
    }
}