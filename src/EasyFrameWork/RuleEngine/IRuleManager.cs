/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */

namespace Easy.RuleEngine
{
    public interface IRuleManager
    {
        bool IsTrue(string expression);
        bool IsTrue(string expression, object workContext);
        object Value(string expression);
        object Value(string expression, object workContext);
    }
}