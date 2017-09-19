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
