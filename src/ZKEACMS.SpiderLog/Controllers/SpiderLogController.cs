/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Mvc.Authorize;
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

        public SpiderLogController(ISearchEngineManager searchEngineManager)
        {
            _searchEngineManager = searchEngineManager;
        }
        public IActionResult Read(string Id)
        {
            return Content(_searchEngineManager.ReadLogContent(Id));
        }
    }
}
