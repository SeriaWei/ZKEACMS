/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.RuleEngine.RuleProviders
{
    public class MoneyRuleProvider : IRuleProvider
    {
        const string FunctionName = "Money";
        public void Process(RuleContext ruleContext, object workContext)
        {
            if (ruleContext.FunctionName == FunctionName)
            {
                decimal value;
                if (decimal.TryParse(ruleContext.Arguments[0].ToString(), out value))
                {
                    ruleContext.Result = value;
                }
            }
        }
    }
}
