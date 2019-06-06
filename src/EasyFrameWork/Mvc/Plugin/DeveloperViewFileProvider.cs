/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */
using Easy.Extend;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.FileProviders;
using Microsoft.Extensions.FileProviders.Physical;
using Microsoft.Extensions.Primitives;
using System;
using System.IO;

namespace Easy.Mvc.Plugin
{
    public class DeveloperViewFileProvider : IFileProvider
    {
        public const string ProjectRootPath = "/Porject.RootPath/";
        public DeveloperViewFileProvider(IWebHostEnvironment hostingEnvironment)
        {
            HostingEnvironment = hostingEnvironment;
        }
        public IDirectoryContents GetDirectoryContents(string subpath)
        {
            return null;
        }
        public IWebHostEnvironment HostingEnvironment { get; }

        public IFileInfo GetFileInfo(string subpath)
        {
            if (subpath.StartsWith(ProjectRootPath, StringComparison.Ordinal))
            {
                var parent = new DirectoryInfo(HostingEnvironment.ContentRootPath).Parent;
                var file = Path.Combine(parent.FullName, subpath.Replace(ProjectRootPath, string.Empty).ToFilePath());
                if (File.Exists(file))
                {
                    return new PhysicalFileInfo(new FileInfo(file));
                }
            }
            return null;
        }

        public IChangeToken Watch(string filter)
        {
            if (filter.StartsWith(ProjectRootPath, StringComparison.Ordinal))
            {
                var parent = new DirectoryInfo(HostingEnvironment.ContentRootPath).Parent;
                var file = Path.Combine(parent.FullName, filter.Replace(ProjectRootPath, string.Empty).ToFilePath());
                if (File.Exists(file))
                {
                    return new PollingFileChangeToken(new FileInfo(file));
                }
            }
            return null;
        }
    }
}
