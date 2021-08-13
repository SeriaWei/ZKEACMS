/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Extend;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.SpiderLog.Models
{
    public class LogWritter : IDisposable
    {
        private const long MaxFileSize = 2048576;
        private StreamWriter _writer;
        private int writeCount = 0;
        public LogWritter(string filePath)
        {
            LogFileInfo = new FileInfo(filePath);
            FilePath = filePath;
            CreateWriter();
        }
        private void CreateWriter()
        {
            bool append = LogFileSize < MaxFileSize;
            _writer = new StreamWriter(FilePath, append, Encoding.UTF8);
        }
        private void NewWriter()
        {
            if (_writer != null)
            {
                _writer.Close();
                _writer.Dispose();
            }
            LogFileInfo.Refresh();
            CreateWriter();
        }
        public long LogFileSize
        {
            get
            {
                if (LogFileInfo.Exists) return LogFileInfo.Length;

                return 0;
            }
        }
        public FileInfo LogFileInfo { get; set; }
        public string FilePath { get; set; }

        public void WriteLog(string log)
        {
            writeCount += 1;

            if (writeCount > 20000) NewWriter();

            _writer.WriteLine(log);
            _writer.Flush();
        }

        public void Dispose()
        {
            _writer.Dispose();
        }

    }
}
