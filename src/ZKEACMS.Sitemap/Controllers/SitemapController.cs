using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Sitemap.Service;

namespace ZKEACMS.Sitemap.Controllers
{
    public class SitemapController : Controller
    {
        private readonly ISitemapService _sitemapService;
        public SitemapController(ISitemapService sitemapService)
        {
            _sitemapService = sitemapService;
        }
        public IActionResult Index()
        {
            return Content(_sitemapService.Get(), "application/xml");
        }
    }
}
