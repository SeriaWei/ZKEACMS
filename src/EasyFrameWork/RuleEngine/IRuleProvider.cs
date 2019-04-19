/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */

namespace Easy.RuleEngine
{
    public interface IRuleProvider
    {
        void Process(RuleContext ruleContext, object workContext);
    }
}