using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Common.Models;
using ZKEACMS.Setting;
using ZKEACMS.Sitemap.Service;

namespace ZKEACMS.Sitemap.Controllers
{
    public class RobotsController : Controller
    {
        private readonly IApplicationSettingService _applicationSettingService;
        public RobotsController(IApplicationSettingService applicationSettingService)
        {
            _applicationSettingService = applicationSettingService;
        }
        public IActionResult Index()
        {
            return Content(_applicationSettingService.Get<Robots>().Content, "text/plain");
        }
    }
}
