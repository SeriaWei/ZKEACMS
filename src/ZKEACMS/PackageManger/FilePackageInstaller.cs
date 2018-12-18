/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using Easy.Extend;
using Microsoft.AspNetCore.Hosting;
using Newtonsoft.Json;

namespace ZKEACMS.PackageManger
{
    public class FilePackageInstaller : IPackageInstaller
    {
        public FilePackageInstaller(IHostingEnvironment hostingEnvironment)
        {
            HostingEnvironment = hostingEnvironment;
        }
        public IHostingEnvironment HostingEnvironment;
        public virtual string PackageInstaller
        {
            get
            {
                return "FilePackageInstaller";
            }
        }
        public virtual string MapPath(string path)
        {
            return Path.Combine(HostingEnvironment.WebRootPath, path.Replace("~/", "").ToFilePath());
        }
        public virtual object Install(Package package)
        {
            var filePackage = package as FilePackage;
            if (filePackage != null)
            {
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
                    });
                }
            }
            return package;
        }

        public virtual Package Pack(object obj)
        {
            FilePackage package = CreatePackage();
            var directory = obj as DirectoryInfo;
            if (directory != null)
            {
                CollectFiles(directory, package);
            }
            else
            {
                var files = obj as IEnumerable<System.IO.FileInfo>;
                if (files != null)
                {
                    files.Each(file =>
                    {
                        package.Files.Add(new FileInfo { FileName = file.Name, FilePath = file.FullName.Replace(MapPath("~/"), "~/"), Content = File.ReadAllBytes(file.FullName) });
                    });
                }
            }
            return package;
        }
        public virtual FilePackage CreatePackage()
        {
            return new FilePackage(PackageInstaller);
        }
        public void CollectFiles(DirectoryInfo directory, FilePackage package)
        {
            directory.GetDirectories().Each(dir => CollectFiles(dir, package));
            directory.GetFiles().Each(file =>
            {
                package.Files.Add(new FileInfo { FileName = file.Name, FilePath = file.FullName.Replace(MapPath("~/"), "~/"), Content = File.ReadAllBytes(file.FullName) });
            });
        }

        public object Install(string packageContent)
        {
            Package package = JsonConvert.DeserializeObject(packageContent, CreatePackage().GetType()) as Package;
            package.Content = packageContent;
            return Install(package);
        }
    }
}
