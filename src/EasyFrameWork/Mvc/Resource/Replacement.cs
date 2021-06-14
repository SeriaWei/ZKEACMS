/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

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
