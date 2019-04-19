/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using Easy.RuleEngine.Scripting.Ast;

namespace Easy.RuleEngine.Scripting.Compiler
{
    public class Interpreter
    {
        public EvaluationResult Evalutate(EvaluationContext context)
        {
            return new InterpreterVisitor(context).Evaluate();
        }
    }

    public class EvaluationContext
    {
        public AbstractSyntaxTree Tree { get; set; }
        public Func<string, IList<object>, object> MethodInvocationCallback { get; set; }
    }
}