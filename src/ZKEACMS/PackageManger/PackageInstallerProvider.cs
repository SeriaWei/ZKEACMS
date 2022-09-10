/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Serializer;
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
            using (MemoryStream ms = new MemoryStream())
            {
                stream.CopyTo(ms);
                byte[] rowData = ms.ToArray();
                package = JsonConverter.Deserialize<T>(Encoding.UTF8.GetString(ms.ToArray()));
                package.SetRowData(rowData);
                return CreateInstaller(package.PackageInstaller);
            }
        }
    }
}
