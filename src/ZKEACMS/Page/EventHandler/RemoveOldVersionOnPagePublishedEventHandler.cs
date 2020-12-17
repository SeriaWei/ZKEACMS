/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */


using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ZKEACMS.Event;

namespace ZKEACMS.Page
{
    public class RemoveOldVersionOnPagePublishedEventHandler : IEventHandler
    {
        private readonly IPageService _pageService;
        private const int keepVersions = 6;
        public RemoveOldVersionOnPagePublishedEventHandler(IPageService pageService)
        {
            _pageService = pageService;
        }

        public void Handle(object entity, EventArg e)
        {
            PageEntity page = entity as PageEntity;
            if (page != null)
            {
                var allPublishedVersion = _pageService.Get(m => m.ReferencePageID == page.ReferencePageID && m.IsPublishedPage == true).OrderByDescending(m => m.PublishDate).ToList();
                if (allPublishedVersion.Count > keepVersions)
                {
                    for (int i = keepVersions; i < allPublishedVersion.Count; i++)
                    {
                        _pageService.DeleteVersion(allPublishedVersion[i].ID);
                    }
                }
            }
        }
    }
}
