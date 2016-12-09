/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Article.Models;
using ZKEACMS.Article.ViewModel;
using ZKEACMS.Widget;

namespace ZKEACMS.Article.Service
{
    public class ArticleDetailWidgetService : WidgetService<ArticleDetailWidget, ArticleDbContext>
    {
        private readonly IArticleService _articleService;
        public ArticleDetailWidgetService(IWidgetBasePartService widgetService, IArticleService articleService, IApplicationContext applicationContext) : base(widgetService, applicationContext)
        {
            _articleService = articleService;
        }

        public override DbSet<ArticleDetailWidget> CurrentDbSet
        {
            get
            {
                return DbContext.ArticleDetailWidget;
            }
        }

        public override WidgetViewModelPart Display(WidgetBase widget, HttpContext httpContext)
        {
            int articleId;
            int.TryParse(httpContext.Request.Query["id"], out articleId);
            var viewModel = new ArticleDetailViewModel
            {
                Current = _articleService.Get(articleId)
            };
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
            var layout = httpContext.GetLayout();
            layout.Page.MetaKeyWorlds = viewModel.Current.MetaKeyWords;
            layout.Page.MetaDescription = viewModel.Current.MetaDescription;
            layout.Page.Title = viewModel.Current.Title;
            return widget.ToWidgetViewModelPart(viewModel);
        }
    }
}