/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ZKEACMS.PackageManger
{
    public interface IPackageInstaller
    {
        string PackageInstaller { get; }
        object Install(Package package);
        object Install(string packageContent);
        Package Pack(object obj);
    }
}
