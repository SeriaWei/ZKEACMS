/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using ZKEACMS.Common.Models;
using ZKEACMS.Widget;

namespace ZKEACMS.Common.Service
{
    public class VideoWidgetService : WidgetService<VideoWidget>
    {
        public VideoWidgetService(IWidgetService widgetService) : base(widgetService)
        {
        }
    }
}