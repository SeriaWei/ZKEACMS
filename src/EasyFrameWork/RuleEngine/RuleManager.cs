using System;
using System.Collections.Generic;
using System.Linq;
using Easy.RuleEngine.Scripting;

namespace Easy.RuleEngine
{
    public class RuleManager : IRuleManager
    {
        private readonly IEnumerable<IRuleProvider> _ruleProviders;
        private readonly IEnumerable<IScriptExpressionEvaluator> _evaluators;
        private object _workContext;

        public RuleManager(IEnumerable<IRuleProvider> ruleProviders, IEnumerable<IScriptExpressionEvaluator> evaluators)
        {
            _ruleProviders = ruleProviders;
            _evaluators = evaluators;
        }

        public bool Matches(string expression, object workContext)
        {
            _workContext = workContext;
            var evaluator = _evaluators.FirstOrDefault();
            if (evaluator == null)
            {
                throw new Exception("There are currently not scripting engine enabled");
            }

            var result = evaluator.Evaluate(expression, new List<IGlobalMethodProvider> { new GlobalMethodProvider(this) });
            if (!(result is bool))
            {
                throw new Exception("Expression is not a boolean value");
            }
            return (bool)result;
        }

        private class GlobalMethodProvider : IGlobalMethodProvider
        {
            private readonly RuleManager _ruleManager;

            public GlobalMethodProvider(RuleManager ruleManager)
            {
                _ruleManager = ruleManager;
            }

            public void Process(GlobalMethodContext context)
            {
                var ruleContext = new RuleContext
                {
                    FunctionName = context.FunctionName,
                    Arguments = context.Arguments.ToArray(),
                    Result = context.Result
                };

                foreach (var ruleProvider in _ruleManager._ruleProviders)
                {
                    ruleProvider.Process(ruleContext, _ruleManager._workContext);
                }

                context.Result = ruleContext.Result;
            }
        }
    }
}