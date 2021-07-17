/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System.Linq;
using ZKEACMS.Article.Service;
using ZKEACMS.Event;
using ZKEACMS.Page;
using ZKEACMS.SectionWidget.Service;

namespace ZKEACMS.SectionWidget.EventHandler
{
    public class UpdateLinkOnPageUrlChangedEventHandler : IEventHandler
    {
        private readonly ISectionContentTitleService _sectionContentTitleService;
        private readonly ISectionContentCallToActionService _sectionContentCallToActionService;
        private readonly ISectionContentImageService _sectionContentImageService;

        public UpdateLinkOnPageUrlChangedEventHandler(ISectionContentTitleService sectionContentTitleService, 
            ISectionContentCallToActionService sectionContentCallToActionService, 
            ISectionContentImageService sectionContentImageService)
        {
            _sectionContentTitleService = sectionContentTitleService;
            _sectionContentCallToActionService = sectionContentCallToActionService;
            _sectionContentImageService = sectionContentImageService;
        }

        public void Handle(object entity, EventArg e)
        {
            PageEntity page = entity as PageEntity;
            if (page != null && e.Data != null)
            {
                string oldPageUrl = e.Data.ToString();
                _sectionContentTitleService.UpdateDetailPageUrl(oldPageUrl, page.Url);
                _sectionContentCallToActionService.UpdateDetailPageUrl(oldPageUrl, page.Url);
                _sectionContentImageService.UpdateDetailPageUrl(oldPageUrl, page.Url);
            }
        }
    }
}
