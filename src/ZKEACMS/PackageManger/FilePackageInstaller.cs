/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using Easy.Extend;
using Easy.Serializer;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;
using ZKEACMS.Common.Service;

namespace ZKEACMS.PackageManger
{
    public class FilePackageInstaller : IPackageInstaller
    {
        private HashSet<string> _additionalFiles;
        public FilePackageInstaller(IWebHostEnvironment hostingEnvironment)
        {
            HostingEnvironment = hostingEnvironment;
            _additionalFiles = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
        }
        public IWebHostEnvironment HostingEnvironment;
        public virtual string PackageInstaller
        {
            get
            {
                return "FilePackageInstaller";
            }
        }
        public string[] AddtionalUsing { get; set; }
        public virtual string MapPath(string path)
        {
            return HostingEnvironment.MapPath(path);
        }
        public virtual object Install(Package package)
        {
            var filePackage = package as FilePackage;
            if (filePackage is null) throw new Exception("The package is not FilePackage!");

            if (filePackage.Files != null)
            {
                filePackage.Files.ForEach(file =>
                {
                    string filePath = MapPath(file.FilePath);
                    var directory = Path.GetDirectoryName(filePath);
                    if (!Directory.Exists(directory))
                    {
                        Directory.CreateDirectory(directory);
                    }
                    File.WriteAllBytes(filePath, file.Content);
                    TemplateService.EnsureHasViewImports(filePath, AddtionalUsing);
                });
            }

            return package;
        }

        public virtual Package Pack(object obj)
        {
            FilePackage package = CreatePackage();
            foreach (var item in _additionalFiles)
            {
                System.IO.FileInfo fileInfo = new System.IO.FileInfo(MapPath(item));
                if (fileInfo.Exists)
                {
                    package.Files.Add(new FileInfo
                    {
                        FilePath = item,
                        FileName = fileInfo.Name,
                        Content = fileInfo.ReadAllBytes()
                    });
                }
            }
            return package;
        }
        public void IncludeFile(string relativeFilePath)
        {
            _additionalFiles.Add(relativeFilePath);
        }
        public void IncludeFilesInFolder(string relativePath)
        {
            DirectoryInfo folder = new DirectoryInfo(MapPath(relativePath));
            if (folder.Exists)
            {
                foreach (var item in folder.GetFiles())
                {
                    _additionalFiles.Add(relativePath + "/" + item.Name);
                }
                foreach (var item in folder.GetDirectories())
                {
                    IncludeFilesInFolder(relativePath + "/" + item.Name);
                }
            }
        }
        public virtual FilePackage CreatePackage()
        {
            return new FilePackage(PackageInstaller);
        }
    }
}
