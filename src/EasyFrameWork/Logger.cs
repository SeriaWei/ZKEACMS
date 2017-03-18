/* http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy.Mvc.Plugin;
using Microsoft.AspNetCore.Hosting;
using System;
using System.Collections.Generic;
using System.IO;

namespace Easy
{
    public class Logger : ILogger
    {
        public const string Path = "Logs";
        public const string TitleTemplate = "----------------------------------------------------------------\r\n时间：{0}\r\n详细信息:\r\n";
        public const string Split = "\r\n----------------------------------------------------------------\r\n";
        public const string FileTemplate = "LOG_{0}.txt";
        public const string DateNameTemplate = "yyyy-MM-dd";
        private readonly IHostingEnvironment _hostingEnvironment;
        public Logger(IHostingEnvironment hostingEnvironment)
        {
            _hostingEnvironment = hostingEnvironment;
        }
        #region 私有方法
        void WriteInfo(string msg)
        {
            lock (Path)
            {
                string logPath = GetPath(DateTime.Now);
                FileStream fs = new FileStream(logPath, FileMode.Append, FileAccess.Write);
                StreamWriter writer = new StreamWriter(fs);
                writer.WriteLine(string.Format(TitleTemplate, DateTime.Now) + msg + Split);
                writer.Dispose();
                fs.Dispose();
            }
        }
        string GetDir()
        {
            string logPath = System.IO.Path.Combine(_hostingEnvironment.WebRootPath, Path);
            if (!Directory.Exists(logPath))
            {
                Directory.CreateDirectory(logPath);
            }
            return logPath;
        }
        string GetPath(DateTime date)
        {
            string logPath = GetDir();
            string fileName = string.Format(FileTemplate, date.ToString(DateNameTemplate));
            logPath += "\\" + fileName;
            return logPath;
        }
        #endregion
        public void Info(string msg)
        {
            WriteInfo(msg);
        }
        public void Error(Exception ex)
        {
            string msg = ex.Message + "\r\n";
            msg += ex.ToString();
            WriteInfo(msg);
        }
        public string ReadLog()
        {
            return ReadLog(DateTime.Now);
        }
        public string ReadLog(DateTime date)
        {
            string logPath = GetPath(date);
            FileStream fs = new FileStream(logPath, FileMode.OpenOrCreate, FileAccess.Read);
            StreamReader reader = new StreamReader(fs);
            string s = reader.ReadToEnd();
            reader.Dispose();
            fs.Dispose();
            return s;
        }

        public List<FileInfo> GetLogs()
        {
            string logPath = GetDir();
            string[] files = Directory.GetFiles(logPath, "LOG_*.txt");
            List<FileInfo> results = new List<FileInfo>();
            foreach (var item in files)
            {
                FileInfo file = new FileInfo(item);
                results.Add(file);
            }
            return results;
        }
    }
}
