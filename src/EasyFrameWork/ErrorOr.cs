/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Easy
{
    public class ErrorOr
    {
        private readonly List<Violation> _ruleViolations;
        public ErrorOr()
        {
            _ruleViolations = new List<Violation>();
        }
        public void AddError(Error error)
        {
            _ruleViolations.Add(error);
        }
        public void AddError(string message)
        {
            _ruleViolations.Add(new Error(string.Empty, message));
        }
        public void AddError(string name, string message)
        {
            _ruleViolations.Add(new Error(name, message));
        }
        public void AddWarning(Warning warning)
        {
            _ruleViolations.Add(warning);
        }

        public void AddWarning(string message)
        {
            _ruleViolations.Add(new Warning(string.Empty, message));
        }
        public void AddWarning(string name, string message)
        {
            _ruleViolations.Add(new Warning(name, message));
        }
        public void AddInfo(Info info)
        {
            _ruleViolations.Add(info);
        }

        public void AddInfo(string message)
        {
            _ruleViolations.Add(new Info(string.Empty, message));
        }
        public void AddInfo(string name, string message)
        {
            _ruleViolations.Add(new Info(name, message));
        }
        public bool HasError
        {
            get { return _ruleViolations.Any(m => m is Error); }
        }

        public IEnumerable<Error> Errors
        {
            get
            {
                foreach (var item in _ruleViolations)
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

                foreach (var item in Errors)
                {
                    msg.AppendLine(item.Message);
                }
                return msg.ToString();
            }
        }

        public IEnumerable<Warning> Warnings
        {
            get
            {
                foreach (var item in _ruleViolations)
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
                foreach (var item in Warnings)
                {
                    msg.AppendLine(item.Message);
                }
                return msg.ToString();
            }
        }
        public IEnumerable<Info> Infos
        {
            get
            {
                foreach (var item in _ruleViolations)
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
                foreach (var item in Infos)
                {
                    msg.AppendLine(item.Message);
                }
                return msg.ToString();
            }
        }

        public static implicit operator ErrorOr(Error error)
        {
            var result = new ErrorOr();
            result._ruleViolations.Add(error);
            return result;
        }
        public static implicit operator ErrorOr(Warning warning)
        {
            var result = new ErrorOr();
            result._ruleViolations.Add(warning);
            return result;
        }
        public static implicit operator ErrorOr(Info info)
        {
            var result = new ErrorOr();
            result._ruleViolations.Add(info);
            return result;
        }
    }
    public class ErrorOr<T> : ErrorOr
    {
        public ErrorOr() { }
        public ErrorOr(T result)
        {
            Result = result;
        }
        public T Result { get; set; }

        public static implicit operator ErrorOr<T>(T result)
        {
            return new ErrorOr<T>(result);
        }
        public static implicit operator ErrorOr<T>(Error error)
        {
            var result = new ErrorOr<T>();
            result.AddError(error);
            return result;
        }
        public static implicit operator ErrorOr<T>(Warning warning)
        {
            var result = new ErrorOr<T>();
            result.AddWarning(warning);
            return result;
        }
        public static implicit operator ErrorOr<T>(Info info)
        {
            var result = new ErrorOr<T>();
            result.AddInfo(info);
            return result;
        }
    }
}
