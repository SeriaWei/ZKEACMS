using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Rule
{
    public class RuleWorkContext
    {
        public string Url { get; set; }
        public string QueryString { get; set; }
        public string UserAgent { get; set; }
        public DateTime Now { get { return DateTime.Now; } }
    }
}
