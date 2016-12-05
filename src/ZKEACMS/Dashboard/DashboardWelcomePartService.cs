/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using ZKEACMS.Dashboard;

namespace ZKEACMS.Dashboard
{
    public class DashboardWelcomePartService : IDashboardPartDriveService
    {

        public DashboardPart Create()
        {
            return new DashboardPart
            {
                Order = -1,
                ViewName = "Dashboard.Welcome"
            };
        }
    }
}