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

        public virtual void Process(RuleContext ruleContext, object workContext)
        {
            switch (ruleContext.FunctionName)
            {
                case _Equals:
                    {
                        if (ruleContext.Arguments.Length == 2)
                        {
                            ruleContext.Result = ruleContext.Arguments[0] != null && ruleContext.Arguments[0].Equals(ruleContext.Arguments[1]);
                        }
                        break;
                    }
                case NotEquals:
                    {
                        if (ruleContext.Arguments.Length == 2)
                        {
                            ruleContext.Result = ruleContext.Arguments[0] != null && !ruleContext.Arguments[0].Equals(ruleContext.Arguments[1]);
                        }
                        break;
                    }
                case StartsWith:
                    {
                        if (ruleContext.Arguments.Length == 2)
                        {
                            ruleContext.Result = ruleContext.Arguments[0] != null && ruleContext.Arguments[0].ToString().StartsWith(ruleContext.Arguments[1].ToString());
                        }
                        break;
                    }
                case NotStartsWith:
                    if (ruleContext.Arguments.Length == 2)
                    {
                        ruleContext.Result = ruleContext.Arguments[0] != null && !ruleContext.Arguments[0].ToString().StartsWith(ruleContext.Arguments[1].ToString());
                    }
                    break;
                case EndsWith:
                    {
                        if (ruleContext.Arguments.Length == 2)
                        {
                            ruleContext.Result = ruleContext.Arguments[0] != null && ruleContext.Arguments[0].ToString().EndsWith(ruleContext.Arguments[1].ToString());
                        }
                        break;
                    }
                case NotEndsWith:
                    {
                        if (ruleContext.Arguments.Length == 2)
                        {
                            ruleContext.Result = ruleContext.Arguments[0] != null && !ruleContext.Arguments[0].ToString().EndsWith(ruleContext.Arguments[1].ToString());
                        }
                        break;
                    }
                case Contains:
                    {
                        if (ruleContext.Arguments.Length == 2)
                        {
                            ruleContext.Result = ruleContext.Arguments[0] != null && ruleContext.Arguments[0].ToString().Contains(ruleContext.Arguments[1].ToString());
                        }
                        break;
                    }
                case NotContains:
                    {
                        if (ruleContext.Arguments.Length == 2)
                        {
                            ruleContext.Result = ruleContext.Arguments[0] != null && !ruleContext.Arguments[0].ToString().Contains(ruleContext.Arguments[1].ToString());
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
                                if (item.Equals(ruleContext.Arguments[0]))
                                {
                                    ruleContext.Result = true;
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
            }
        }
    }
}