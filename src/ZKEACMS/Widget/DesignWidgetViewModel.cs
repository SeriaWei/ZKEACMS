/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
namespace ZKEACMS.Widget
{
    public class DesignWidgetViewModel : WidgetViewModelPart
    {
        public DesignWidgetViewModel(WidgetViewModelPart widgetPart, string pageId)
        {
            PageID = pageId;
            ViewModel = widgetPart.ViewModel;
            Widget = widgetPart.Widget;
        }
        public string PageID { get; set; }
    }
}