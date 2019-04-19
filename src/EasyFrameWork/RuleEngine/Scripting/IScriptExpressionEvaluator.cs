/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */

using System.Collections.Generic;

namespace Easy.RuleEngine.Scripting
{
    public interface IScriptExpressionEvaluator
    {
        object Evaluate(string expression, IEnumerable<IGlobalMethodProvider> providers);
    }
}