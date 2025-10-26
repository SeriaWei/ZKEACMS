/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.Updater.Models
{
    public class DBVersionOption
    {
        public string DBVersion { get; set; }
        public string BaseVersion { get; set; }
        public string[] Source { get; set; }
    }
}
