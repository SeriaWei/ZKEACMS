/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using Microsoft.AspNetCore.Hosting;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace ZKEACMS.Common.Service
{
    public class EventViewerService : IEventViewerService
    {
        private readonly IWebHostEnvironment _hostingEnvironment;
        private const string LoggerFoler = "Logs";
        public EventViewerService(IWebHostEnvironment hostingEnvironment)
        {
            _hostingEnvironment = hostingEnvironment;
        }
        public void Delete(string id)
        {
            var filePath = Path.Combine(_hostingEnvironment.ContentRootPath, LoggerFoler, id);
            if (File.Exists(filePath))
            {
                File.Delete(filePath);
            }
        }

        public IEnumerable<FileInfo> Get()
        {
            var dir = new DirectoryInfo(Path.Combine(_hostingEnvironment.ContentRootPath, LoggerFoler));
            if (dir.Exists)
            {
                return dir.GetFiles("*.log").OrderByDescending(m => m.Name);
            }
            return Enumerable.Empty<FileInfo>();
        }

        public void DeleteAll()
        {
            foreach (var item in Get())
            {
                Delete(item.Name);
            }
        }

        public string ReadLog(string id)
        {
            var filePath = Path.Combine(_hostingEnvironment.ContentRootPath, LoggerFoler, id);
            if (File.Exists(filePath))
            {
                return File.ReadAllText(filePath, Encoding.UTF8);
            }
            return string.Empty;
        }
    }
}
