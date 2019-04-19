/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */

using System;
using System.Collections;
using System.Linq;

namespace Easy.RuleEngine.RuleProviders
{
    public class CommonMethodsRuleProvider : IRuleProvider
    {
        const string _Equals = "Equals";
        const string NotEquals = "NotEquals";
        const string StartsWith = "StartsWith";
        const string EndsWith = "EndsWith";
        const string Contains = "Contains";
        const string NotStartsWith = "NotStartsWith";
        const string NotEndsWith = "NotEndsWith";
        const string NotContains = "NotContains";
        const string IsBlank = "IsBlank";
        const string IsNotBlank = "IsNotBlank";
        const string In = "In";
        const string NotIn = "NotIn";
        const string GreaterThan = "GreaterThan";
        const string GreaterThanOrEquals = "GreaterThanOrEquals";
        const string LessThan = "LessThan";
        const string LessThanOrEquals = "LessThanOrEquals";

        public virtual bool IsEquals(object value1, object value2)
        {
            if (value1 is string && value2 is string)
            {
                return ((string)value1).Equals((string)value2, StringComparison.OrdinalIgnoreCase);
            }
            else if (value1 == null && value2 == null)
            {
                return true;
            }
            else
            {
                return value1 != null && value1.Equals(value2);
            }
        }

        public virtual void Process(RuleContext ruleContext, object workContext)
        {
            switch (ruleContext.FunctionName)
            {
                case _Equals:
                    {
                        if (ruleContext.Arguments.Length == 2)
                        {
                            ruleContext.Result = IsEquals(ruleContext.Arguments[0], ruleContext.Arguments[1]);
                        }
                        break;
                    }
                case NotEquals:
                    {
                        if (ruleContext.Arguments.Length == 2)
                        {
                            ruleContext.Result = !IsEquals(ruleContext.Arguments[0], ruleContext.Arguments[1]);
                        }
                        break;
                    }
                case StartsWith:
                    {
                        if (ruleContext.Arguments.Length == 2 && ruleContext.Arguments[0] != null && ruleContext.Arguments[1] != null)
                        {
                            ruleContext.Result = ruleContext.Arguments[0].ToString().StartsWith(ruleContext.Arguments[1].ToString(), StringComparison.OrdinalIgnoreCase);
                        }
                        break;
                    }
                case NotStartsWith:
                    {
                        if (ruleContext.Arguments.Length == 2 && ruleContext.Arguments[0] != null && ruleContext.Arguments[1] != null)
                        {
                            ruleContext.Result = !ruleContext.Arguments[0].ToString().StartsWith(ruleContext.Arguments[1].ToString(), StringComparison.OrdinalIgnoreCase);
                        }
                        break;
                    }
                case EndsWith:
                    {
                        if (ruleContext.Arguments.Length == 2 && ruleContext.Arguments[0] != null && ruleContext.Arguments[1] != null)
                        {
                            ruleContext.Result = ruleContext.Arguments[0].ToString().EndsWith(ruleContext.Arguments[1].ToString(), StringComparison.OrdinalIgnoreCase);
                        }
                        break;
                    }
                case NotEndsWith:
                    {
                        ruleContext.Result = false;
                        if (ruleContext.Arguments.Length == 2 && ruleContext.Arguments[0] != null && ruleContext.Arguments[1] != null)
                        {
                            ruleContext.Result = !ruleContext.Arguments[0].ToString().EndsWith(ruleContext.Arguments[1].ToString(), StringComparison.OrdinalIgnoreCase);
                        }
                        break;
                    }
                case Contains:
                    {
                        if (ruleContext.Arguments.Length == 2 && ruleContext.Arguments[0] != null && ruleContext.Arguments[1] != null)
                        {
                            ruleContext.Result = ruleContext.Arguments[0].ToString().IndexOf(ruleContext.Arguments[1].ToString(), StringComparison.OrdinalIgnoreCase) >= 0;
                        }
                        break;
                    }
                case NotContains:
                    {
                        ruleContext.Result = false;
                        if (ruleContext.Arguments.Length == 2 && ruleContext.Arguments[0] != null && ruleContext.Arguments[1] != null)
                        {
                            ruleContext.Result = ruleContext.Arguments[0].ToString().IndexOf(ruleContext.Arguments[1].ToString(), StringComparison.OrdinalIgnoreCase) < 0;
                        }
                        break;
                    }
                case In:
                    {
                        if (ruleContext.Arguments.Length == 2)
                        {
                            ruleContext.Result = false;
                            foreach (var item in (ruleContext.Arguments[1] as IEnumerable))
                            {
                                if (IsEquals(item, ruleContext.Arguments[0]))
                                {
                                    ruleContext.Result = true;
                                    break;
                                }
                            }
                        }
                        break;
                    }
                case NotIn:
                    {
                        if (ruleContext.Arguments.Length == 2)
                        {
                            ruleContext.Result = true;
                            foreach (var item in (ruleContext.Arguments[1] as IEnumerable))
                            {
                                if (IsEquals(item, ruleContext.Arguments[0]))
                                {
                                    ruleContext.Result = false;
                                    break;
                                }
                            }
                        }
                        break;
                    }
                case IsBlank:
                    {
                        ruleContext.Result = ruleContext.Arguments[0] == null || string.IsNullOrWhiteSpace(ruleContext.Arguments[0].ToString());
                        break;
                    }
                case IsNotBlank:
                    {
                        ruleContext.Result = ruleContext.Arguments[0] != null && !string.IsNullOrWhiteSpace(ruleContext.Arguments[0].ToString());
                        break;
                    }
                case GreaterThan:
                    {
                        if (ruleContext.Arguments.Length == 2)
                        {
                            if (ruleContext.Arguments[0] is DateTime && ruleContext.Arguments[1] is DateTime)
                            {
                                ruleContext.Result = (DateTime)ruleContext.Arguments[0] > (DateTime)ruleContext.Arguments[1];
                            }
                            else if (ruleContext.Arguments[0] is int && ruleContext.Arguments[1] is int)
                            {
                                ruleContext.Result = (int)ruleContext.Arguments[0] > (int)ruleContext.Arguments[1];
                            }
                            else if (ruleContext.Arguments[0] is decimal && ruleContext.Arguments[1] is decimal)
                            {
                                ruleContext.Result = (decimal)ruleContext.Arguments[0] > (decimal)ruleContext.Arguments[1];
                            }
                        }
                        break;
                    }
                case GreaterThanOrEquals:
                    {
                        if (ruleContext.Arguments.Length == 2)
                        {
                            if (ruleContext.Arguments[0] is DateTime && ruleContext.Arguments[1] is DateTime)
                            {
                                ruleContext.Result = (DateTime)ruleContext.Arguments[0] >= (DateTime)ruleContext.Arguments[1];
                            }
                            else if (ruleContext.Arguments[0] is int && ruleContext.Arguments[1] is int)
                            {
                                ruleContext.Result = (int)ruleContext.Arguments[0] >= (int)ruleContext.Arguments[1];
                            }
                            else if (ruleContext.Arguments[0] is decimal && ruleContext.Arguments[1] is decimal)
                            {
                                ruleContext.Result = (decimal)ruleContext.Arguments[0] >= (decimal)ruleContext.Arguments[1];
                            }
                        }
                        break;
                    }
                case LessThan:
                    {
                        if (ruleContext.Arguments.Length == 2)
                        {
                            if (ruleContext.Arguments[0] is DateTime && ruleContext.Arguments[1] is DateTime)
                            {
                                ruleContext.Result = (DateTime)ruleContext.Arguments[0] < (DateTime)ruleContext.Arguments[1];
                            }
                            else if (ruleContext.Arguments[0] is int && ruleContext.Arguments[1] is int)
                            {
                                ruleContext.Result = (int)ruleContext.Arguments[0] < (int)ruleContext.Arguments[1];
                            }
                            else if (ruleContext.Arguments[0] is decimal && ruleContext.Arguments[1] is decimal)
                            {
                                ruleContext.Result = (decimal)ruleContext.Arguments[0] < (decimal)ruleContext.Arguments[1];
                            }
                        }
                        break;
                    }
                case LessThanOrEquals:
                    {
                        if (ruleContext.Arguments.Length == 2)
                        {
                            if (ruleContext.Arguments[0] is DateTime && ruleContext.Arguments[1] is DateTime)
                            {
                                ruleContext.Result = (DateTime)ruleContext.Arguments[0] <= (DateTime)ruleContext.Arguments[1];
                            }
                            else if (ruleContext.Arguments[0] is int && ruleContext.Arguments[1] is int)
                            {
                                ruleContext.Result = (int)ruleContext.Arguments[0] <= (int)ruleContext.Arguments[1];
                            }
                            else if (ruleContext.Arguments[0] is decimal && ruleContext.Arguments[1] is decimal)
                            {
                                ruleContext.Result = (decimal)ruleContext.Arguments[0] <= (decimal)ruleContext.Arguments[1];
                            }
                        }
                        break;
                    }
            }
        }
    }
}