/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Reflection;
using System.Text;
using Easy.Extend;
using Easy.Serializer;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;

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
            using (MemoryStream ms = new MemoryStream())
            {
                using (GZipStream gzOut = new GZipStream(ms, CompressionMode.Compress))
                {
                    byte[] bytes = JsonConvert.SerializeObject(this, new JsonSerializerSettings { ContractResolver = new SerializeAllPropertyContractResolver() }).ToByte();
                    gzOut.Write(bytes, 0, bytes.Length);
                }
                return ms.ToArray();
            }
        }

        public override string ToString()
        {
            return Encoding.UTF8.GetString(_rawData);
        }
    }
}
