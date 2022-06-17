/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.RepositoryPattern
{
    public class ServiceResult
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
        public void AddRuleViolation(string message)
        {
            RuleViolations.Add(new RuleViolation(string.Empty, message));
        }
        public void AddRuleViolation(string name, string message)
        {
            RuleViolations.Add(new RuleViolation(name, message));
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
    }
    public class ServiceResult<T> : ServiceResult
    {

        public T Result { get; set; }
    }
}
