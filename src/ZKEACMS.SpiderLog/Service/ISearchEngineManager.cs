/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.SpiderLog.Models;

namespace ZKEACMS.SpiderLog.Service
{
    public interface ISearchEngineManager
    {
        SearchEngine Get(string userAgent);
        void Log(string name, DateTime dateTime, string url);
        IEnumerable<SearchEngineVisitTime> GetSearchEngineVisitTimes();
    }
}
