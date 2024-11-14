/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Easy.RepositoryPattern
{
    public class ServiceResult
    {
        public ServiceResult()
        {
            RuleViolations = new List<Violation>();
        }
        public List<Violation> RuleViolations
        {
            get;
            private set;
        }
        public void AddError(string message)
        {
            RuleViolations.Add(new Error(string.Empty, message));
        }
        public void AddError(string name, string message)
        {
            RuleViolations.Add(new Error(name, message));
        }
        public void AddWarning(string message)
        {
            RuleViolations.Add(new Warning(string.Empty, message));
        }
        public void AddWarning(string name, string message)
        {
            RuleViolations.Add(new Warning(name, message));
        }
        public void AddInfo(string message)
        {
            RuleViolations.Add(new Info(string.Empty, message));
        }
        public void AddInfo(string name, string message)
        {
            RuleViolations.Add(new Info(name, message));
        }
        public bool HasError
        {
            get { return RuleViolations.Any(m => m is Error); }
        }

        public IEnumerable<Error> Errors
        {
            get
            {
                foreach (var item in RuleViolations)
                {
                    if (item is Error error)
                    {
                        yield return error;
                    }
                }
            }
        }

        public string ErrorMessage
        {
            get
            {
                var msg = new StringBuilder();

                foreach (Violation item in Errors)
                {
                    if (item is Error)
                    {
                        msg.AppendLine(item.Message);
                    }
                }
                return msg.ToString();
            }
        }

        public IEnumerable<Warning> Warnings
        {
            get
            {
                foreach (var item in RuleViolations)
                {
                    if (item is Warning warning)
                    {
                        yield return warning;
                    }
                }
            }
        }
        public string WarningMessage
        {
            get
            {
                var msg = new StringBuilder();
                foreach (Violation item in RuleViolations)
                {
                    if (item is Warning)
                    {
                        msg.AppendLine(item.Message);
                    }
                }
                return msg.ToString();
            }
        }
        public IEnumerable<Info> Infos
        {
            get
            {
                foreach (var item in RuleViolations)
                {
                    if (item is Info info)
                    {
                        yield return info;
                    }
                }
            }
        }
        public string InfoMessage
        {
            get
            {
                var msg = new StringBuilder();
                foreach (Violation item in RuleViolations)
                {
                    if (item is Info)
                    {
                        msg.AppendLine(item.Message);
                    }
                }
                return msg.ToString();
            }
        }

        public static implicit operator ServiceResult(Error error)
        {
            var result = new ServiceResult();
            result.RuleViolations.Add(error);
            return result;
        }
        public static implicit operator ServiceResult(Warning warning)
        {
            var result = new ServiceResult();
            result.RuleViolations.Add(warning);
            return result;
        }
        public static implicit operator ServiceResult(Info info)
        {
            var result = new ServiceResult();
            result.RuleViolations.Add(info);
            return result;
        }
    }
    public class ServiceResult<T> : ServiceResult
    {
        public ServiceResult() { }
        public ServiceResult(T result)
        {
            Result = result;
        }
        public T Result { get; set; }

        public static implicit operator ServiceResult<T>(T result)
        {
            return new ServiceResult<T>(result);
        }
        public static implicit operator ServiceResult<T>(Error error)
        {
            var result = new ServiceResult<T>();
            result.RuleViolations.Add(error);
            return result;
        }
        public static implicit operator ServiceResult<T>(Warning warning)
        {
            var result = new ServiceResult<T>();
            result.RuleViolations.Add(warning);
            return result;
        }
        public static implicit operator ServiceResult<T>(Info info)
        {
            var result = new ServiceResult<T>();
            result.RuleViolations.Add(info);
            return result;
        }
    }
}
