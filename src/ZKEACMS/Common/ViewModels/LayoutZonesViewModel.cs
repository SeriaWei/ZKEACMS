/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System.Collections.Generic;
using ZKEACMS.Layout;
using ZKEACMS.Page;
using ZKEACMS.Widget;
using ZKEACMS.Zone;

namespace ZKEACMS.Common.ViewModels
{
    public class LayoutZonesViewModel
    {
        public LayoutEntity Layout { get; set; }
        public PageEntity Page { get; set; }
        public string PageId { get; set; }
        public string LayoutId { get; set; }
        public IEnumerable<ZoneEntity> Zones { get; set; }
        public IEnumerable<WidgetBase> Widgets { get; set; }
        public LayoutHtmlCollection LayoutHtml { get; set; }

    }
}