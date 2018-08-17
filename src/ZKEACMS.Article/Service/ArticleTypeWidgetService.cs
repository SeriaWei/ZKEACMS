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
    public class ArticleTypeWidgetService : WidgetService<ArticleTypeWidget>
    {
        private readonly IArticleTypeService _articleTypeService;
        public ArticleTypeWidgetService(IWidgetBasePartService widgetService, IArticleTypeService articleTypeService, IApplicationContext applicationContext, CMSDbContext dbContext)
            : base(widgetService, applicationContext, dbContext)
        {
            _articleTypeService = articleTypeService;
        }

        public override WidgetViewModelPart Display(WidgetBase widget, ActionContext actionContext)
        {
            ArticleTypeWidget currentWidget = widget as ArticleTypeWidget;
            var types = _articleTypeService.Get(m => m.ParentID == currentWidget.ArticleTypeID);
            int ac = actionContext.RouteData.GetCategory();
            if (actionContext.RouteData.GetCategoryUrl().IsNullOrEmpty() && ac > 0)
            {
                var articleType = _articleTypeService.Get(ac);
                if (articleType != null && articleType.Url.IsNotNullAndWhiteSpace())
                {
                    actionContext.RedirectTo($"{actionContext.RouteData.GetPath()}/{articleType.Url}", true);
                }
            }

            return widget.ToWidgetViewModelPart(new ArticleTypeWidgetViewModel
            {
                ArticleTypes = types,
                ArticleTypeID = ac
            });
        }
    }
}