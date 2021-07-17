/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.RuleEngine.RuleProviders
{
    public class DateRuleProvider : IRuleProvider
    {
        const string FunctionName = "Date";
        public void Process(RuleContext ruleContext, object workContext)
        {
            if (ruleContext.FunctionName == FunctionName)
            {
                DateTime date;
                if (DateTime.TryParse(ruleContext.Arguments[0].ToString(), out date))
                {
                    ruleContext.Result = date;
                }
            }
        }
    }
}
