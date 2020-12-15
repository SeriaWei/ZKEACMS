/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

namespace ZKEACMS.Dashboard
{
    public class DashboardPart
    {
        public DashboardPart()
        {

        }
        public DashboardPart(string viewName, object model, int order)
        {
            ViewName = viewName;
            ViewModel = model;
            Order = order;
        }
        public int Order { get; set; }
        public string ViewName { get; set; }
        public object ViewModel { get; set; }
    }
}