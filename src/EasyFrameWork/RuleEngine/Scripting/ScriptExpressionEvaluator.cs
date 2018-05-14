using System;
using System.Collections.Generic;
using System.Linq;
using CacheManager.Core;
using Easy.RuleEngine.Scripting.Ast;
using Easy.RuleEngine.Scripting.Compiler;

namespace Easy.RuleEngine.Scripting
{
    public class ScriptExpressionEvaluator : IScriptExpressionEvaluator
    {
        private readonly ICacheManager<ScriptExpressionResult> _cacheManager;

        public ScriptExpressionEvaluator()
        {
            _cacheManager = CacheFactory.Build<ScriptExpressionResult>(setting =>
            {
                setting.WithDictionaryHandle("ScriptExpressionResult");
            });
        }

        public object Evaluate(string expression, IEnumerable<IGlobalMethodProvider> providers)
        {
            var expr = _cacheManager.GetOrAdd(expression, ctx =>
            {
                var ast = ParseExpression(expression);
                return new ScriptExpressionResult { Tree = ast, Errors = ast.GetErrors().ToList() };
            });

            if (expr.Errors.Any())
            {
                //TODO: Collect all errors
                throw new Exception($"Syntax error: {expr.Errors.First().Message}");
            }

            var result = EvaluateExpression(expr.Tree, providers);
            if (result.IsError)
            {
                throw new ApplicationException(result.ErrorValue.Message);
            }

            return result.Value;
        }

        private AbstractSyntaxTree ParseExpression(string expression)
        {
            return new Parser(expression).Parse();
        }

        private EvaluationResult EvaluateExpression(AbstractSyntaxTree tree, IEnumerable<IGlobalMethodProvider> providers)
        {
            var context = new EvaluationContext
            {
                Tree = tree,
                MethodInvocationCallback = (m, args) => Evaluate(providers, m, args)
            };
            return new Interpreter().Evalutate(context);
        }

        private object Evaluate(IEnumerable<IGlobalMethodProvider> globalMethodProviders, string name, IEnumerable<object> args)
        {
            var globalMethodContext = new GlobalMethodContext
            {
                FunctionName = name,
                Arguments = args.ToArray(),
                Result = null
            };

            foreach (var globalMethodProvider in globalMethodProviders)
            {
                globalMethodProvider.Process(globalMethodContext);
            }

            return globalMethodContext.Result;
        }
    }
}