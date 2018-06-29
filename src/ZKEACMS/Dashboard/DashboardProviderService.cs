/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy;
using System.Collections.Generic;
using System.Linq;
using Microsoft.Extensions.DependencyInjection;

namespace ZKEACMS.Dashboard
{
    public class DashboardProviderService : IDashboardProviderService
    {
        private readonly IEnumerable<IDashboardPartDriveService> _dashboardPartDriveServices;
        public DashboardProviderService(IEnumerable<IDashboardPartDriveService> dashboardPartDriveServices)
        {
            _dashboardPartDriveServices = dashboardPartDriveServices;
        }
        public IEnumerable<DashboardPart> GetDashboardParts()
        {
            if (!_dashboardPartDriveServices.Any()) return new List<DashboardPart>();
            return _dashboardPartDriveServices.Select(p => p.Create()).Where(p => p != null);
        }
    }
}