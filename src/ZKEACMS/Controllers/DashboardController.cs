/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */

using ZKEACMS.Common.ViewModels;
using Easy.Mvc.Attribute;
using Easy.Mvc.Authorize;
using Microsoft.AspNetCore.Mvc;
using ZKEACMS.Dashboard;
using Microsoft.AspNetCore.Http;

namespace ZKEACMS.Controllers
{
    [DefaultAuthorize]
    public class DashboardController : Controller
    {
        private readonly IDashboardProviderService _dashboardProviderService;
        public DashboardController(IDashboardProviderService dashboardProviderService)
        {
            _dashboardProviderService = dashboardProviderService;
        }

        public ActionResult Index()
        {
            return View(new DashboardViewModel { Parts = _dashboardProviderService.GetDashboardParts() });
        }

    }
}
