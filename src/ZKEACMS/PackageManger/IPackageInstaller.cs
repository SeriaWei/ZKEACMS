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
        Package Pack(object obj);
    }
}
