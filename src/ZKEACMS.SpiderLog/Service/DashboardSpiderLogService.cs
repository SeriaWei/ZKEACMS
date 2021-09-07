/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Dashboard;
using ZKEACMS.SpiderLog.Models;

namespace ZKEACMS.SpiderLog.Service
{
    public class DashboardSpiderLogService : IDashboardPartDriveService
    {
        private readonly ISearchEngineManager _searchEngineManager;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public DashboardSpiderLogService(ISearchEngineManager searchEngineManager, IHttpContextAccessor httpContextAccessor)
        {
            _searchEngineManager = searchEngineManager;
            _httpContextAccessor = httpContextAccessor;
        }

        public DashboardPart Create()
        {
            var logs = _searchEngineManager.GetSearchEngineVisitLogs(_httpContextAccessor.HttpContext.Request.Host.Host).OrderByDescending(m => m.LastVisitAt).ToList();
            if (logs.Count == 0) return null;

            return new DashboardPart("Dashboard.SpiderLog", logs, 30);
        }
    }
}
