/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.RepositoryPattern
{
    public abstract class Violation
    {
        public Violation(string parameterName, string message)
        {
            ParameterName = parameterName;
            Message = message;
        }
        public string ParameterName
        {
            get;
            private set;
        }
        public string Message
        {
            get;
            private set;
        }
    }
}
