/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

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
        private static Regex _logLevelRegex = new Regex(@"\[(DBG|INF|WRN|ERR)\]", RegexOptions.Compiled);
        private readonly FileStream _fileStream;

        public Encoding Encoding { get; }

        public LogReader(string logFile,Encoding encoding)
        {
            _fileStream = new FileStream(logFile, FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
            Encoding = encoding;
        }
        public void SetPosition(long position)
        {
            _fileStream.Position = position;
        }
        public IEnumerable<LogEntry> Take(int count)
        {
            int entryCount = 0;
            var line = string.Empty;
            bool nextLineReaded = false;
            var messageBuilder = new StringBuilder();
            while (entryCount < count && (nextLineReaded || (line = ReadLine()) != null))
            {
                nextLineReaded = false;
                long position = _fileStream.Position;
                messageBuilder.AppendLine(line);
                if (!IsNewLogEntry(line)) continue;

                LogLevel logLevel = ParseLogLevel(line);
                while ((line = ReadLine()) != null)
                {
                    if (IsNewLogEntry(line))
                    {
                        nextLineReaded = true;
                        break;
                    }
                    position = _fileStream.Position;
                    messageBuilder.AppendLine(line);
                }

                yield return new LogEntry
                {
                    LogLevel = logLevel,
                    Message = messageBuilder.ToString(),
                    NextPosition = _fileStream.Position == _fileStream.Length ? -1 : position
                };
                entryCount++;
                messageBuilder.Clear();
            }
        }

        private string ReadLine()
        {
            List<byte> buffer = new List<byte>();
            do
            {
                int bit = _fileStream.ReadByte();
                if (bit == -1)
                {
                    break;
                }
                if (bit == 0x0A || bit == 0x0D)
                {
                    while (bit == 0x0A || bit == 0x0D)
                    {
                        bit = _fileStream.ReadByte();
                    }
                    if (bit != -1)
                    {
                        _fileStream.Position -= 1;
                    }
                    break;
                }
                buffer.Add((byte)bit);
            } while (_fileStream.Position != _fileStream.Length);

            if (buffer.Count == 0)
            {
                return null;
            }
            return Encoding.GetString(buffer.ToArray());
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
