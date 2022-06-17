/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Mvc.Extend;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using System;
using System.IO;
using System.Text;

namespace Easy.Logging
{
    public class FileLogger : ILogger
    {
        static string _logFolder = "Logs";
        const string _eventTime = "Event Time: {0}";
        const string _splitLine = "----------------------------------------------------------------";
        const string _logExtention = "{0}.log";
        const string _logFileNameFormat = "yyyyMMdd";
        private readonly string _contentRootPath;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly string _loggerCategory;
        public FileLogger(IHttpContextAccessor httpContextAccessor, string contentRootPath, string loggerCategory)
        {
            _contentRootPath = contentRootPath;
            _loggerCategory = loggerCategory;
            _httpContextAccessor = httpContextAccessor;
        }
        #region 私有方法
        void WriteInfo(string msg)
        {
            lock (_logFolder)
            {
                string logPath = GetLogFile();
                FileStream fs = new FileStream(logPath, FileMode.Append, FileAccess.Write);
                StreamWriter writer = new StreamWriter(fs, Encoding.UTF8);
                writer.WriteLine(_splitLine);
                writer.WriteLine(_loggerCategory);
                writer.WriteLine(string.Format(_eventTime, DateTime.Now.ToString("G")));
                writer.WriteLine(msg);
                if (_httpContextAccessor.HttpContext != null && _httpContextAccessor.HttpContext.Request != null)
                {
                    writer.WriteLine("Method:{0}", _httpContextAccessor.HttpContext.Request.Method);
                    if (_httpContextAccessor.HttpContext.Request.Headers != null)
                    {
                        writer.WriteLine("Headers:");
                        foreach (var item in _httpContextAccessor.HttpContext.Request.Headers)
                        {
                            writer.WriteLine($"{item.Key}:{item.Value}");
                        }
                    }

                    writer.WriteLine(_httpContextAccessor.HttpContext.Request.GetAbsoluteUrl());
                }
                writer.WriteLine(_splitLine);
                writer.Flush();
                fs.Flush();
                writer.Dispose();
                fs.Dispose();
            }
        }
        string GetLogFile()
        {
            string logPath = System.IO.Path.Combine(_contentRootPath, _logFolder);
            if (!Directory.Exists(logPath))
            {
                Directory.CreateDirectory(logPath);
            }

            string fileName = string.Format(_logExtention, DateTime.Now.ToString(_logFileNameFormat));
            return System.IO.Path.Combine(logPath, fileName);
        }
        #endregion
        public IDisposable BeginScope<TState>(TState state)
        {
            return null;
        }

        public bool IsEnabled(LogLevel logLevel)
        {
            return logLevel == LogLevel.Error;
        }

        public void Log<TState>(LogLevel logLevel, EventId eventId, TState state, Exception exception, Func<TState, Exception, string> formatter)
        {
            if (IsEnabled(logLevel))
            {
                if (exception == null)
                {
                    WriteInfo(formatter(state, exception));
                }
                else
                {
                    WriteInfo(exception.ToString());
                }
            }
        }
    }
}
