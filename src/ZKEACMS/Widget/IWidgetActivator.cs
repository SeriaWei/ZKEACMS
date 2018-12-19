/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
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
