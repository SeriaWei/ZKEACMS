﻿/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Microsoft.Extensions.DependencyModel;
using Microsoft.Extensions.DependencyModel.Resolution;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Easy.Mvc.Plugin
{
    public class DependencyAssemblyResolver
    {
        public DependencyAssemblyResolver(string basePath)
        {
            BasePath = basePath;
        }
        public string BasePath { get; set; }
        public string[] ResolveAssemblyPaths()
        {
            return Directory.GetFiles(BasePath, "*.dll");
        }
    }
}
