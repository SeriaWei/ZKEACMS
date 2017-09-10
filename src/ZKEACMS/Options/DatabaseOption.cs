using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Options
{
    public class DatabaseOption
    {
        public string DefaultConnection { get; set; }
        public string Sqlite { get; set; }
        public string MySql { get; set; }
    }
}
