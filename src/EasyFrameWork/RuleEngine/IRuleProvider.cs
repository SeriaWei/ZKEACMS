/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

namespace Easy.RuleEngine
{
    public interface IRuleProvider
    {
        void Process(RuleContext ruleContext, object workContext);
    }
}