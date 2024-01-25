using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Easy.Logging
{
    public class LogReader : IDisposable
    {
        private static Regex _newLogRegex = new Regex(@"^([0-9]{4})-([0-9]{1,2})-([0-9]{1,2})", RegexOptions.Compiled);
        private static Regex _logLevelRegex = new Regex(@"(\[DBG|INF|WRN|ERR\])", RegexOptions.Compiled);
        private readonly FileStream _fileStream;
        public LogReader(string logFile)
        {
            _fileStream = new FileStream(logFile, FileMode.Open, FileAccess.Read);
        }
        public void SetPosition(long position)
        {
            _fileStream.Position = position;
        }
        public IEnumerable<LogEntry> Read(int takes)
        {
            int entryCount = 0;
            using (StreamReader streamReader = new StreamReader(_fileStream, Encoding.UTF8))
            {
                var line = string.Empty;
                bool nextLineReaded = false;
                var messageBuilder = new StringBuilder();
                while (entryCount < takes && (nextLineReaded || (line = streamReader.ReadLine()) != null))
                {
                    nextLineReaded = false;                    
                    messageBuilder.AppendLine(line);
                    if (!IsNewLogEntry(line)) continue;

                    LogLevel logLevel = ParseLogLevel(line);
                    while ((line = streamReader.ReadLine()) != null)
                    {
                        if (IsNewLogEntry(line))
                        {
                            nextLineReaded = true;
                            break;
                        }
                        messageBuilder.AppendLine(line);
                    }
                    
                    yield return new LogEntry
                    {
                        LogLevel = logLevel,
                        Message = messageBuilder.ToString()
                    };
                    entryCount++;
                    messageBuilder.Clear();
                }
            }
        }

        private bool IsNewLogEntry(string line)
        {
            return _newLogRegex.IsMatch(line);
        }

        private LogLevel ParseLogLevel(string line)
        {
            var match = _logLevelRegex.Match(line);
            if (match.Success)
            {
                if (match.Groups[1].Value == "DBG")
                {
                    return LogLevel.Debug;
                }
                if (match.Groups[1].Value == "INF")
                {
                    return LogLevel.Info;
                }
                else if (match.Groups[1].Value == "WRN")
                {
                    return LogLevel.Warn;
                }
                else if (match.Groups[1].Value == "ERR")
                {
                    return LogLevel.Error;
                }
            }
            return LogLevel.Info;
        }

        public void Dispose()
        {
            _fileStream.Dispose();
        }
    }
}
