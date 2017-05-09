using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Easy.Logging
{
    public class FileLogger : Microsoft.Extensions.Logging.ILogger
    {
        public const string Path = "Logs";
        public const string TitleTemplate = "----------------------------------------------------------------\r\n时间：{0}\r\n详细信息:\r\n";
        public const string Split = "\r\n----------------------------------------------------------------\r\n";
        public const string FileTemplate = "LOG_{0}.txt";
        public const string DateNameTemplate = "yyyy-MM-dd";
        private readonly IHostingEnvironment _hostingEnvironment;
        public FileLogger(IHostingEnvironment hostingEnvironment)
        {
            _hostingEnvironment = hostingEnvironment;
        }
        #region 私有方法
        void WriteInfo(string msg)
        {
            lock (Path)
            {
                string logPath = GetLogFile();
                FileStream fs = new FileStream(logPath, FileMode.Append, FileAccess.Write);
                StreamWriter writer = new StreamWriter(fs);
                writer.WriteLine(string.Format(TitleTemplate, DateTime.Now) + msg + Split);
                writer.Flush();
                fs.Flush();
                writer.Dispose();
                fs.Dispose();
            }
        }
        string GetLogFile()
        {
            string logPath = System.IO.Path.Combine(_hostingEnvironment.WebRootPath, Path);
            if (!Directory.Exists(logPath))
            {
                Directory.CreateDirectory(logPath);
            }

            string fileName = string.Format(FileTemplate, DateTime.Now.ToString(DateNameTemplate));
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
            if (IsEnabled(logLevel) && exception != null)
            {
                WriteInfo(exception.ToString());
            }
        }
    }
}
