/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

using ZKEACMS.Event;
using ZKEACMS.Layout;
using ZKEACMS.Widget;
using ZKEACMS.Zone;

namespace ZKEACMS.Page
{
    public class RemoveCacheOnPageDeletedEventHandler : IEventHandler
    {
        private readonly IWidgetBasePartService _widgetService;
        private readonly IZoneService _zoneService;
        private readonly ILayoutHtmlService _layoutHtmlService;

        public RemoveCacheOnPageDeletedEventHandler(IWidgetBasePartService widgetService, IZoneService zoneService, ILayoutHtmlService layoutHtmlService)
        {
            _widgetService = widgetService;
            _zoneService = zoneService;
            _layoutHtmlService = layoutHtmlService;
        }

        public void Handle(object entity, EventArg e)
        {
            PageEntity page = entity as PageEntity;
            if (page != null)
            {
                _widgetService.RemoveCache(page.ID);
                _zoneService.RemoveCache(page.ID);
                _layoutHtmlService.RemoveCache(page.ID);
            }            
        }
    }
}
