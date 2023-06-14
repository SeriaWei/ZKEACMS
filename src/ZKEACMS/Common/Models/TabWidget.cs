/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using Easy.MetaData;
using ZKEACMS.MetaData;
using ZKEACMS.Widget;

namespace ZKEACMS.Common.Models
{
    public class TabWidget : SimpleWidgetBase
    {
        public TabWidget()
        {
            TabItems = new List<TabItem>();
        }
        public List<TabItem> TabItems { get; set; }
    }

    class TabWidgetMetaData : WidgetMetaData<TabWidget>
    {
        protected override void ViewConfigure()
        {
            base.ViewConfigure();
            ViewConfig(m => m.Title).AsHidden();
            ViewConfig(m => m.TabItems).AsListEditor();
        }
    }

}