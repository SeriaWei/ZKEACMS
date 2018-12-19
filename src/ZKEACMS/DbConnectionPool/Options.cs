/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.DbConnectionPool
{
    public class Options
    {
        public Options() { MaximumRetained = Environment.ProcessorCount * 2; }
        public int MaximumRetained { get; set; }
    }
}
