/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using Easy;
using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Options
{
    public class DatabaseOption
    {
        public DbTypes DbType { get; set; }
        public string ConnectionString { get; set; }
    }
}
