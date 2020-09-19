using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Options
{
    public class HostOption
    {
        public string Domain { get; set; }
        public int? Port { get; set; }
        public string Scheme { get; set; }
    }
}
