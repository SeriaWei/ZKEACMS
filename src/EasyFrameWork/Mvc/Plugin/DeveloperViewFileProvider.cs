using Microsoft.Extensions.FileProviders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.Primitives;
using Microsoft.Extensions.FileProviders.Physical;
using Microsoft.AspNetCore.Hosting;
using System.IO;
using Microsoft.Extensions.DependencyInjection;

namespace Easy.Mvc.Plugin
{
    public class DeveloperViewFileProvider : IFileProvider
    {
        public DeveloperViewFileProvider(IHostingEnvironment hostingEnvironment)
        {
            HostingEnvironment = hostingEnvironment;
        }
        public IDirectoryContents GetDirectoryContents(string subpath)
        {
            return null;
        }
        public IHostingEnvironment HostingEnvironment { get; }
        public IFileInfo GetFileInfo(string subpath)
        {
            if (subpath.StartsWith("/Porject.RootPath/"))
            {
                var parent = new DirectoryInfo(HostingEnvironment.ContentRootPath).Parent;
                var file = Path.Combine(parent.FullName, subpath.Replace("/Porject.RootPath/", "").Replace("/", "\\"));
                if (File.Exists(file))
                {
                    return new PhysicalFileInfo(new FileInfo(file));
                }
            }
            return null;
        }

        public IChangeToken Watch(string filter)
        {
            return null;
        }
    }
}
