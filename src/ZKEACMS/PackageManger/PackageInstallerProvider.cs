/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Serializer;
using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Compression;
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

        public IPackageInstaller CreateInstaller(Stream stream, out Package package)
        {
            using (GZipStream gzip = new GZipStream(stream, CompressionMode.Decompress))
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    gzip.CopyTo(ms);
                    byte[] rowData = ms.ToArray();
                    string json = Encoding.UTF8.GetString(ms.ToArray());
                    var packageBase = JsonConverter.Deserialize<Package>(json);
                    var packageInstaller = CreateInstaller(packageBase.PackageInstaller);
                    package = JsonConverter.Deserialize(json, packageInstaller.GetPackageType()) as Package;
                    package.SetRowData(rowData);
                    return packageInstaller;
                }
            }

        }
    }
}
