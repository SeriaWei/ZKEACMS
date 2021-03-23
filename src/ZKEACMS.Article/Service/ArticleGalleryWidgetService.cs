/* http://www.zkea.net/ 
 * Copyright 2021 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy;
using Easy.Constant;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Article.Models;
using ZKEACMS.Article.ViewModel;
using ZKEACMS.Widget;

namespace ZKEACMS.Article.Service
{
    public class ArticleGalleryWidgetService : SimpleWidgetService<ArticleGalleryWidget>
    {
        private readonly IArticleService _articleService;
        private readonly IArticleGalleryService _articleGalleryService;
        public ArticleGalleryWidgetService(IWidgetBasePartService widgetBasePartService,
            IApplicationContext applicationContext,
            CMSDbContext dbContext,
            IArticleService articleService,
            IArticleGalleryService articleGalleryService)
            : base(widgetBasePartService, applicationContext, dbContext)
        {
            _articleService = articleService;
            _articleGalleryService = articleGalleryService;
        }
        public override object Display(WidgetDisplayContext widgetDisplayContext)
        {
            var widget = widgetDisplayContext.Widget as ArticleGalleryWidget;
            ArticleGalleryWidgetViewModel viewModel = new ArticleGalleryWidgetViewModel { DetailPageUrl = widget.DetailPageUrl };
            var articleGallery = _articleGalleryService.Get(widget.ArticleGalleryId);

            if (articleGallery == null || articleGallery.Articles.Count() == 0)
            {
                viewModel.Articles = Enumerable.Empty<ArticleEntity>();
            }
            else
            {
                var articleIds = articleGallery.Articles.Where(m => m.Article != null && m.Status == (int)RecordStatus.Active)
                    .Select(m => m.Article.ArticleID)
                    .ToArray();

                viewModel.Articles = _articleService.Get(m => articleIds.Contains(m.ID) && m.IsPublish).OrderBy(m => Array.IndexOf(articleIds, m.ID)).ToList();
            }
            return viewModel;
        }
    }
}
