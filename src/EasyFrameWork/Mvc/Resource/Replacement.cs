using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.Mvc.Resource
{
    public class Replacement
    {
        public Dictionary<string, List<string>> Scripts { get; set; }
        public Dictionary<string, List<string>> Styles { get; set; }
    }
}
