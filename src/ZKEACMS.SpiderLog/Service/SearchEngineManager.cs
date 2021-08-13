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

namespace ZKEACMS.SpiderLog.Service
{
    public class SearchEngineManager : ISearchEngineManager
    {
        private readonly ISearchEngineService _searchEngineService;
        private static ConcurrentDictionary<string, LogWritter> _loggerWriters;
        static SearchEngineManager()
        {
            _loggerWriters = new ConcurrentDictionary<string, LogWritter>();
        }

        public SearchEngineManager(ISearchEngineService searchEngineService)
        {
            _searchEngineService = searchEngineService;
        }

        public SearchEngine Get(string userAgent)
        {
            return _searchEngineService.Get().FirstOrDefault(m => m.IsMatch(userAgent));
        }

        public void Log(string name, DateTime dateTime, string url)
        {
            var writer = _loggerWriters.GetOrAdd(name, key =>
            {
                string filePath = Path.Combine(PluginBase.GetPath<SpiderLogPlug>(), "Logs", key + ".log");
                return new LogWritter(filePath);
            });
            writer.WriteLog(dateTime.ToString("s") + "\t" + url);
        }

        public IEnumerable<SearchEngineVisitTime> GetSearchEngineVisitTimes()
        {
            string logFolder = Path.Combine(PluginBase.GetPath<SpiderLogPlug>(), "Logs");
            foreach (var item in _searchEngineService.Get())
            {
                var logFile = new FileInfo(Path.Combine(logFolder, item.Name + ".log"));
                if (logFile.Exists)
                {
                    yield return new SearchEngineVisitTime
                    {
                        Name = item.Name,
                        LastVisitAt = logFile.LastWriteTime
                    };
                }
            }
        }
    }
}
