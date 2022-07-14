/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */


namespace ZKEACMS.Widget
{
    public class DesignWidgetViewModel : WidgetViewModelPart
    {
        public DesignWidgetViewModel(WidgetViewModelPart widgetPart, string pageId) 
            : base(widgetPart.Widget, widgetPart.ViewModel)
        {
            PageId = pageId;
        }
        public string PageId { get; set; }
    }
}