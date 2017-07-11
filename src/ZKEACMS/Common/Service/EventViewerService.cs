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
        private readonly IHostingEnvironment _hostingEnvironment;
        private const string LoggerFoler = "Logs";
        public EventViewerService(IHostingEnvironment hostingEnvironment)
        {
            _hostingEnvironment = hostingEnvironment;
        }
        public void Delete(string fileName)
        {
            var filePath = Path.Combine(_hostingEnvironment.WebRootPath, LoggerFoler, fileName);
            if (File.Exists(filePath))
            {
                File.Delete(filePath);
            }
        }

        public IEnumerable<FileInfo> Get()
        {
            var dir = new DirectoryInfo(Path.Combine(_hostingEnvironment.WebRootPath, LoggerFoler));
            if (dir.Exists)
            {
                return dir.GetFiles("*.txt");
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
    }
}
