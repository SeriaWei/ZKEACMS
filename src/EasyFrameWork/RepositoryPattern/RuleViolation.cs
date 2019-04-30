/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.RepositoryPattern
{
    public class RuleViolation
    {
        public RuleViolation(string parameterName, string errorMessage)
        {
            ParameterName = parameterName;
            ErrorMessage = errorMessage;
        }
        public string ParameterName
        {
            get;
            private set;
        }
        public string ErrorMessage
        {
            get;
            private set;
        }
    }
}
