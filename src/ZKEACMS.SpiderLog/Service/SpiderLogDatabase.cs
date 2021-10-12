/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.SpiderLog.Models;
using ZKEACMS.Storage;

namespace ZKEACMS.SpiderLog.Service
{
    public class SpiderLogDatabase : PluginData<SpiderLogPlug>, ISpiderLogDatabase
    {
        public void WriteLog(SearchEngineVisitLog visitLog)
        {
            GetCollection<SearchEngineVisitLog>(visitLog.Name).Insert(visitLog);
        }
        public SearchEngineVisitLog GetLastVisit(string host, string name)
        {
            var lastVisit = GetCollection<SearchEngineVisitLog>(name).Query()
                .Where(m => m.Host == host)
                .OrderByDescending(m => m.VisitAt)
                .Limit(1)
                .ToArray();

            if (lastVisit.Length > 0) return lastVisit[0];

            return null;
        }
        public IEnumerable<SearchEngineVisitLog> GetAll(string host, string name)
        {
            return GetCollection<SearchEngineVisitLog>(name)
                .Query()
                .Where(m => m.Host == host)
                .OrderByDescending(m => m.VisitAt)
                .Limit(1000)
                .ToEnumerable();
        }
    }
}
