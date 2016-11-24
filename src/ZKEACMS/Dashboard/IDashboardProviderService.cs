/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Collections.Generic;

namespace ZKEACMS.Dashboard
{
    public interface IDashboardProviderService
    {
        IEnumerable<DashboardPart> GetDashboardParts();
    }
}