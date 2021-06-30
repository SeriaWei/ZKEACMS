/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Cache;
using System.Collections.Generic;
using System.Linq;
using ZKEACMS.Event;
using ZKEACMS.Widget;

namespace ZKEACMS.Page
{
    public class UpdatePageUrlOnPageUrlChangedEventHandler : IEventHandler
    {
        private readonly IPageService _pageService;

        public UpdatePageUrlOnPageUrlChangedEventHandler(IPageService pageService)
        {
            _pageService = pageService;
        }

        public void Handle(object entity, EventArg e)
        {
            PageEntity page = entity as PageEntity;
            if (page != null && e.Data != null)
            {
                string oldPageUrl = e.Data.ToString();
                var pages = _pageService.Get(m => m.Url.StartsWith(oldPageUrl));
                foreach (var item in pages)
                {
                    item.Url = page.Url + item.Url.Substring(oldPageUrl.Length);
                }
                _pageService.UpdateRange(pages.ToArray());
            }
        }
    }
}
