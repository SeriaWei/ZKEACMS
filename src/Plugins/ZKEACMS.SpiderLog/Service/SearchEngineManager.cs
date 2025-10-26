/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Easy;
using ZKEACMS.SpiderLog.Models;
using System.Collections.Concurrent;
using System.IO;
using System.Text;
using Easy.Extend;

namespace ZKEACMS.SpiderLog.Service
{
    public class SearchEngineManager : ISearchEngineManager
    {
        private readonly ISearchEngineService _searchEngineService;
        private readonly ISpiderLogData _spiderLogDatabase;

        public SearchEngineManager(ISearchEngineService searchEngineService, ISpiderLogData spiderLogDatabase)
        {
            _searchEngineService = searchEngineService;
            _spiderLogDatabase = spiderLogDatabase;
        }

        public SearchEngine Get(string userAgent)
        {
            return _searchEngineService.Get().FirstOrDefault(m => m.IsMatch(userAgent));
        }

        public void Log(string name, string host, string url)
        {
            _spiderLogDatabase.WriteLog(new SearchEngineVisitLog
            {
                Host = host,
                Name = name,
                Url = url,
                VisitAt = DateTime.Now
            });
        }

        public IEnumerable<SearchEngineVisitLog> GetLastVisitLogs(string host)
        {
            foreach (var item in _searchEngineService.Get())
            {
                var lastVisit = _spiderLogDatabase.GetLastVisit(host, item.Name);
                if (lastVisit != null)
                {
                    yield return lastVisit;
                }
            }
        }

        public IEnumerable<SearchEngineVisitLog> GetVisitLogs(string name, string host)
        {
            var engine = _searchEngineService.Get(name);
            if (engine == null) return Enumerable.Empty<SearchEngineVisitLog>();

            return _spiderLogDatabase.GetAll(host, name);
        }
    }
}
