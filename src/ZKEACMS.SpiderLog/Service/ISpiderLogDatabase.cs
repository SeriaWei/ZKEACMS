/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System.Collections.Generic;
using ZKEACMS.SpiderLog.Models;

namespace ZKEACMS.SpiderLog.Service
{
    public interface ISpiderLogDatabase
    {
        IEnumerable<SearchEngineVisitLog> GetAll(string host, string name);
        SearchEngineVisitLog GetLastVisit(string host, string name);
        void WriteLog(SearchEngineVisitLog visitLog);
    }
}