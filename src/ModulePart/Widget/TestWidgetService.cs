using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Widget;

namespace ModulePart.Widget
{
    public class TestWidgetService : WidgetService<TestWidget>
    {
        public TestWidgetService(IWidgetService widgetService) : base(widgetService)
        {
        }
    }
}
