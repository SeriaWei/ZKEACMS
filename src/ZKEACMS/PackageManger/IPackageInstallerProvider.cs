/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace ZKEACMS.PackageManger
{
    public interface IPackageInstallerProvider
    {
        IPackageInstaller CreateInstaller(string packageInstaller);
        IPackageInstaller CreateInstaller<T>(Stream stream,out T package) where T : Package;
    }
}
