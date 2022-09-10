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
        public FilePackageInstaller(IWebHostEnvironment hostingEnvironment)
        {
            HostingEnvironment = hostingEnvironment;
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
            if (HostingEnvironment.IsProduction())
            {
                return Path.Combine(HostingEnvironment.WebRootPath, path.Replace("~/", "").ToFilePath());
            }
            else
            {
                string[] pathArry = path.Replace("~/", "").Split(new char[] { Path.DirectorySeparatorChar, Path.AltDirectorySeparatorChar }, StringSplitOptions.RemoveEmptyEntries);
                if (pathArry.Length > 0 && pathArry[0] == Easy.Mvc.Plugin.Loader.PluginFolder)
                {
                    return Path.Combine(new DirectoryInfo(HostingEnvironment.ContentRootPath).Parent.FullName, Path.Combine(pathArry.Skip(1).ToArray()));
                }
                else
                {
                    return Path.Combine(HostingEnvironment.WebRootPath, path.Replace("~/", "").ToFilePath());
                }
            }
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
            if (obj is DirectoryInfo directory)
            {
                CollectFiles(directory, package);
            }
            else if (obj is IEnumerable<System.IO.FileInfo> files)
            {
                files.Each(file =>
                {
                    package.Files.Add(new FileInfo { FileName = file.Name, FilePath = file.FullName.Replace(MapPath("~/"), "~/"), Content = File.ReadAllBytes(file.FullName) });
                });
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
    }
}
