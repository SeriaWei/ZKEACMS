using System.Collections.Generic;

namespace Easy.RuleEngine.Scripting
{
    public interface IScriptExpressionEvaluator
    {
        object Evaluate(string expression, IEnumerable<IGlobalMethodProvider> providers);
    }
}