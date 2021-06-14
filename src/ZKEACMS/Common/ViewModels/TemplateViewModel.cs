/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Text;
using ZKEACMS.Common.Models;

namespace ZKEACMS.Common.ViewModels
{
    public class TemplateViewModel
    {
        public List<string> Themes { get; set; }

        public List<TemplateFile> Files { get; set; }
    }
}
