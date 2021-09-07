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

        public void Log(string name, string host, string url)
        {
            string key = MakeKey(name, host);
            Tuple<string, string> nameHost = new Tuple<string, string>(name, host);
            var writer = _loggerWriters.GetOrAdd(key, (k, targ) => CreateLogWritter(targ.Item1, targ.Item2), nameHost);
            writer.WriteLog(DateTime.Now.ToString("u") + "\t" + url);
        }

        private LogWritter CreateLogWritter(string name, string host)
        {
            lock (_loggerWritersDic)
            {
                LogWritter logWritter;
                string key = MakeKey(name, host);
                if (!_loggerWritersDic.TryGetValue(key, out logWritter))
                {
                    string filePath = GetLogFilePath(name, host);
                    logWritter = new LogWritter(filePath);
                    _loggerWritersDic.TryAdd(key, logWritter);
                }
                return logWritter;
            }

        }

        public IEnumerable<SearchEngineVisitLog> GetSearchEngineVisitLogs(string host)
        {
            foreach (var item in _searchEngineService.Get())
            {
                var logFile = new FileInfo(GetLogFilePath(item.Name, host));
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
        public string ReadLogContent(string name, string host)
        {
            var engine = _searchEngineService.Get(name);
            if (engine == null) return string.Empty;

            string filePath = GetLogFilePath(engine.Name, host);
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
        private string GetLogFilePath(string name, string host)
        {
            return Path.Combine(GetLogsFolder(), SafePathName(host.ToLower()), $"{SafePathName(name)}.log");
        }
        private string SafePathName(string name)
        {
            HashSet<char> replacedChar = new HashSet<char>();
            foreach (var item in Path.GetInvalidFileNameChars())
            {
                name = name.Replace(item, '-');
                replacedChar.Add(item);
            }
            foreach (var item in Path.GetInvalidPathChars())
            {
                if (replacedChar.Contains(item)) continue;

                name = name.Replace(item, '-');
            }
            return name;
        }
        private string MakeKey(string name, string host)
        {
            return $"{name}-{host}";
        }
    }
}
