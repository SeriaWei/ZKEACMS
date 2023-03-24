/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Reflection;
using System;
using System.Collections;
using System.Collections.Concurrent;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;

namespace Easy.RuleEngine.RuleProviders
{
    public class ValueOfRuleProvider : IRuleProvider
    {
        const string FunctionName = "ValueOf";
        public void Process(RuleContext ruleContext, object workContext)
        {
            if (ruleContext.FunctionName.Equals(FunctionName) && workContext != null)
            {
                if (ruleContext.Arguments[0] is string)
                {
                    try
                    {
                        ruleContext.Result = PropertyHelper.GetPropertyValue(workContext, ruleContext.Arguments[0].ToString());
                        if (ruleContext.Result is IEnumerable && ruleContext.Arguments.Length == 2)
                        {
                            int index = Convert.ToInt32(ruleContext.Arguments[1]);
                            int i = 0;
                            object resultAt = null;
                            foreach (var item in ruleContext.Result as IEnumerable)
                            {
                                if (i == index)
                                {
                                    resultAt = item;
                                    break;
                                }
                                i++;
                            }
                            ruleContext.Result = resultAt;
                        }
                    }
                    catch (Exception ex)
                    {
                        ruleContext.Result = ex.Message;
                    }
                }

            }
        }

    }
}
