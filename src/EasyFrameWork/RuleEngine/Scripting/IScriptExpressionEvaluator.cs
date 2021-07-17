/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System.Collections.Generic;

namespace Easy.RuleEngine.Scripting
{
    public interface IScriptExpressionEvaluator
    {
        object Evaluate(string expression, IEnumerable<IGlobalMethodProvider> providers);
    }
}