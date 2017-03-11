using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Easy.Extend;
using Newtonsoft.Json;

namespace ZKEACMS.PackageManger
{
    public class Package
    {
        public Package(string installer)
        {
            PackageInstaller = installer;
        }
        public virtual string PackageInstaller { get; set; }
        public string Name { get; set; }
        public object Content { get; set; }
        public byte[] ToFilePackage()
        {
            return JsonConvert.SerializeObject(this).ToByte();
        }
    }
}
