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
    public class Error : Violation
    {
        public Error(string message) : base(string.Empty, message)
        {
        }

        public Error(string parameterName, string message) : base(parameterName, message)
        {
        }
    }
}
