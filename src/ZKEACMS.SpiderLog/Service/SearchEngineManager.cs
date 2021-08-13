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
        private static ConcurrentDictionary<string, LogWritter> _loggerWriters = new ConcurrentDictionary<string, LogWritter>();
        private static Dictionary<string, LogWritter> _loggerWritersDic = new Dictionary<string, LogWritter>();

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
            var writer = _loggerWriters.GetOrAdd(name, CreateLogWritter);
            writer.WriteLog(dateTime.ToString("u") + "\t" + url);
        }

        private LogWritter CreateLogWritter(string name)
        {
            lock (_loggerWritersDic)
            {
                LogWritter logWritter;
                if (!_loggerWritersDic.TryGetValue(name, out logWritter))
                {
                    string filePath = GetLogFilePath(name);
                    logWritter = new LogWritter(filePath);
                    _loggerWritersDic.TryAdd(name, logWritter);
                }
                return logWritter;
            }

        }

        public IEnumerable<SearchEngineVisitLog> GetSearchEngineVisitLogs()
        {
            foreach (var item in _searchEngineService.Get())
            {
                var logFile = new FileInfo(GetLogFilePath(item.Name));
                if (logFile.Exists)
                {
                    yield return new SearchEngineVisitLog
                    {
                        Name = item.Name,
                        LastVisitAt = logFile.LastWriteTime
                    };
                }
            }
        }
        public string ReadLogContent(string name)
        {
            string filePath = GetLogFilePath(name);
            if (!File.Exists(filePath)) return string.Empty;

            using (FileStream fileStream = new FileStream(filePath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
            {
                using (StreamReader reader = new StreamReader(fileStream, Encoding.UTF8))
                {
                    return reader.ReadToEnd();
                }
            }
        }

        private string GetLogsFolder()
        {
            return Path.Combine(PluginBase.GetPath<SpiderLogPlug>(), "Logs");
        }
        private string GetLogFilePath(string name)
        {
            return Path.Combine(GetLogsFolder(), $"{name}.log");
        }

    }
}
