/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System.Linq;
using ZKEACMS.Article.Service;
using ZKEACMS.Event;
using ZKEACMS.Page;

namespace ZKEACMS.Article.EventHandler
{
    public class UpdateDetailPageUrlOnPageUrlChangedEventHandler : IEventHandler
    {
        private readonly IArticleListWidgetDataService _articleListWidgetService;
        private readonly IArticleGalleryWidgetDataService _articleGalleryWidgetDataService;
        private readonly IArticleSummaryWidgetDataService _articleSummaryWidgetDataService;
        private readonly IArticleTopWidgetDataService _articleTopWidgetDataService;

        public UpdateDetailPageUrlOnPageUrlChangedEventHandler(IArticleListWidgetDataService articleListWidgetService,
            IArticleGalleryWidgetDataService articleGalleryWidgetDataService, 
            IArticleSummaryWidgetDataService articleSummaryWidgetDataService, 
            IArticleTopWidgetDataService articleTopWidgetDataService)
        {
            _articleListWidgetService = articleListWidgetService;
            _articleGalleryWidgetDataService = articleGalleryWidgetDataService;
            _articleSummaryWidgetDataService = articleSummaryWidgetDataService;
            _articleTopWidgetDataService = articleTopWidgetDataService;
        }

        public void Handle(object entity, EventArg e)
        {
            PageEntity page = entity as PageEntity;
            if (page != null && e.Data != null)
            {
                string oldPageUrl = e.Data.ToString();
                _articleListWidgetService.UpdateDetailPageUrl(oldPageUrl, page.Url);
                _articleGalleryWidgetDataService.UpdateDetailPageUrl(oldPageUrl, page.Url);
                _articleSummaryWidgetDataService.UpdateDetailPageUrl(oldPageUrl, page.Url);
                _articleTopWidgetDataService.UpdateDetailPageUrl(oldPageUrl, page.Url);
            }
        }
    }
}
