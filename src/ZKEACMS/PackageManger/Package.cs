/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Easy.Extend;
using Easy.Serializer;

namespace ZKEACMS.PackageManger
{
    public class Package
    {
        private byte[] _rawData;
        public Package(string installer)
        {
            PackageInstaller = installer;
        }
        public virtual string PackageInstaller { get; set; }
        public void SetRowData(byte[] rawData)
        {
            _rawData = rawData;
        }
        public byte[] GetRowData()
        {
            return _rawData;
        }
        public virtual byte[] ToFilePackage()
        {
            return JsonConverter.Serialize(this).ToByte();
        }

        public override string ToString()
        {
            return Encoding.UTF8.GetString(_rawData);
        }
    }
}
