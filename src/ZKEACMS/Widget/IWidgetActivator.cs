using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Widget
{
    public interface IWidgetActivator
    {
        IWidgetPartDriver Create(WidgetBase widget);
        WidgetBase CreateWidgetViewModel(WidgetBase widget);
    }
}
