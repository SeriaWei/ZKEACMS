/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

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

        public DashboardSpiderLogService(ISearchEngineManager searchEngineManager)
        {
            _searchEngineManager = searchEngineManager;
        }

        public DashboardPart Create()
        {
            var logs = _searchEngineManager.GetSearchEngineVisitLogs().ToList();
            if (logs.Count == 0) return null;

            return new DashboardPart("Dashboard.SpiderLog", logs, 10);
        }
    }
}
