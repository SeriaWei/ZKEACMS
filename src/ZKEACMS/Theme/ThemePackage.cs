/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using ZKEACMS.PackageManger;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ZKEACMS.Theme
{
    public class ThemePackage : FilePackage
    {
        public ThemePackage(string installer) : base(installer)
        {

        }
        public ThemeEntity Theme { get; set; }
    }
}
