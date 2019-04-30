/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.RepositoryPattern
{
    public class ServiceResult<T>
    {
        public ServiceResult()
        {
            RuleViolations = new List<RuleViolation>();
        }
        public List<RuleViolation> RuleViolations
        {
            get;
            private set;
        }

        public bool HasViolation
        {
            get { return RuleViolations != null && RuleViolations.Count > 0; }
        }

        public string ErrorMessage
        {
            get
            {
                string msg = string.Empty;
                if (RuleViolations != null && RuleViolations.Count > 0)
                {
                    foreach (RuleViolation item in RuleViolations)
                    {
                        if (msg != string.Empty)
                            msg += "\r\n";
                        msg += item.ErrorMessage;
                    }
                }
                return msg;
            }
        }
        public T Result { get; set; }
    }
}
