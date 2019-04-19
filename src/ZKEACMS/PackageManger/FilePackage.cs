/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ZKEACMS.PackageManger
{
    public class FilePackage : Package
    {
        public FilePackage(string installer) : base(installer)
        {
            Files = new List<FileInfo>();
        }
        public List<FileInfo> Files { get; set; }
    }

    public class FileInfo
    {
        public string FileName { get; set; }
        public string FilePath { get; set; }
        public byte[] Content { get; set; }
    }
}
