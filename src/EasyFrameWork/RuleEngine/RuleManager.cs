/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */

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

        public bool IsTrue(string expression)
        {
            return IsTrue(expression, null);
        }
        public bool IsTrue(string expression, object workContext)
        {
            var result = Value(expression, workContext);
            if (result == null)
            {
                return false;
            }
            if (!(result is bool))
            {
                throw new Exception("Expression is not a boolean value");
            }
            return (bool)result;
        }

        public object Value(string expression, object workContext)
        {
            _workContext = workContext;
            var evaluator = _evaluators.FirstOrDefault();
            if (evaluator == null)
            {
                throw new Exception("There are currently not scripting engine enabled");
            }

            return evaluator.Evaluate(expression, new List<IGlobalMethodProvider> { new GlobalMethodProvider(this) });
        }
        public object Value(string expression)
        {
            return Value(expression, null);
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
                    if (ruleContext.Result != null)
                    {
                        break;
                    }
                }

                context.Result = ruleContext.Result;
            }
        }
    }
}