/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Easy
{
    public class Warning : Violation
    {
        public Warning(string message) : base(string.Empty, message)
        {
        }
        public Warning(string parameterName, string message) : base(parameterName, message)
        {
        }
    }
}
