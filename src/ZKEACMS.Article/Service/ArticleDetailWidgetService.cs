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
        public ArticleDetailWidgetService(IWidgetBasePartService widgetService, IArticleService articleService, IApplicationContext applicationContext, ArticleDbContext dbContext)
            : base(widgetService, applicationContext, dbContext)
        {
            _articleService = articleService;
        }

        public override DbSet<ArticleDetailWidget> CurrentDbSet
        {
            get
            {
                return (DbContext as ArticleDbContext).ArticleDetailWidget;
            }
        }

        public override WidgetViewModelPart Display(WidgetBase widget, ActionContext actionContext)
        {
            int articleId = actionContext.RouteData.GetPost();
            var viewModel = new ArticleDetailViewModel();
            if (articleId != 0)
            {
                viewModel.Current = _articleService.Get(articleId);
                if (viewModel.Current != null)
                {
                    viewModel.Current.Counter = (viewModel.Current.Counter ?? 0) + 1;
                    _articleService.Update(viewModel.Current);
                    viewModel.Prev = _articleService.GetPrev(viewModel.Current);
                    viewModel.Next = _articleService.GetNext(viewModel.Current);
                }
            }
            if (viewModel.Current == null)
            {
                foreach (var item in _articleService.Get().AsQueryable().OrderByDescending(m => m.ID).Take(1))
                {
                    viewModel.Current = item;
                }
            }
            if (viewModel.Current == null)
            {
                viewModel.Current = new ArticleEntity
                {
                    Title = "文章明细组件使用说明",
                    ImageUrl = "~/Plugins/ZKEACMS.Article/Content/Image/Example.png",
                    ArticleContent = "<p>如上图所示，该组件需要一个<code>文章列表组件</code>组合使用，您需要在其它页面添加一个文章列表组件并链接过来，然后点击文章列表中的文章，该组件就可正常显示文章的内容</p>",
                    CreatebyName = "ZKEASOFT"
                };
            }
            var layout = actionContext.HttpContext.GetLayout();
            if (layout != null && layout.Page != null)
            {
                layout.Page.MetaKeyWorlds = viewModel.Current.MetaKeyWords;
                layout.Page.MetaDescription = viewModel.Current.MetaDescription;
                layout.Page.Title = viewModel.Current.Title;
            }

            return widget.ToWidgetViewModelPart(viewModel);
        }
    }
}