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

        public UpdateDetailPageUrlOnPageUrlChangedEventHandler(IArticleListWidgetDataService articleListWidgetService)
        {
            _articleListWidgetService = articleListWidgetService;
        }

        public void Handle(object entity, EventArg e)
        {
            PageEntity page = entity as PageEntity;
            if (page != null && e.Data != null)
            {
                string oldPageUrl = e.Data.ToString();
                _articleListWidgetService.UpdateDetailPageUrl(oldPageUrl, page.Url);
            }
        }
    }
}
