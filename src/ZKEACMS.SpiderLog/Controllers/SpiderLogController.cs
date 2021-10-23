/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Mvc.Authorize;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.SpiderLog.Service;

namespace ZKEACMS.SpiderLog.Controllers
{
    [DefaultAuthorize]
    public class SpiderLogController : Controller
    {
        private readonly ISearchEngineManager _searchEngineManager;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public SpiderLogController(ISearchEngineManager searchEngineManager, IHttpContextAccessor httpContextAccessor)
        {
            _searchEngineManager = searchEngineManager;
            _httpContextAccessor = httpContextAccessor;
        }
        public IActionResult VisitLog(string Id)
        {
            return View(_searchEngineManager.GetVisitLogs(Id, _httpContextAccessor.HttpContext.Request.Host.Host));
        }
    }
}
