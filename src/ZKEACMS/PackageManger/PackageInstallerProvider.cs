/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace ZKEACMS.PackageManger
{
    public class PackageInstallerProvider : IPackageInstallerProvider
    {
        private readonly IEnumerable<IPackageInstaller> _packageInstallers;
        public PackageInstallerProvider(IEnumerable<IPackageInstaller> packageInstallers)
        {
            _packageInstallers = packageInstallers;
        }
        public IPackageInstaller CreateInstaller(string packageInstaller)
        {
            return _packageInstallers.FirstOrDefault(m => m.PackageInstaller == packageInstaller);
        }

        public IPackageInstaller CreateInstaller<T>(Stream stream, out T package) where T : Package
        {
            StreamReader reader = new StreamReader(stream);
            string content = reader.ReadToEnd();
            package = JsonConvert.DeserializeObject<T>(content);
            package.Content = content;
            return CreateInstaller(package.PackageInstaller);
        }
    }
}
