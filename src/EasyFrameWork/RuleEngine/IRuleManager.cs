/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
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