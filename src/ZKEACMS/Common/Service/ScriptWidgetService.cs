/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using ZKEACMS.Common.Models;
using ZKEACMS.Widget;

namespace ZKEACMS.Common.Service
{
    public class ScriptWidgetService : WidgetService<ScriptWidget>
    {
        public ScriptWidgetService(IWidgetService widgetService) : base(widgetService)
        {
        }
    }
}