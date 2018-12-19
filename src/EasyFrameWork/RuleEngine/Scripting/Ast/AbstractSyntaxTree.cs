/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */

using System.Collections.Generic;

namespace Easy.RuleEngine.Scripting.Ast
{
    public class AbstractSyntaxTree
    {
        public AstNode Root { get; set; }

        public IEnumerable<ErrorAstNode> GetErrors()
        {
            return new ErrorNodeCollector().Collect(Root);
        }
    }

    public class ErrorNodeCollector : AstVisitor
    {
        private readonly List<ErrorAstNode> _errors = new List<ErrorAstNode>();

        public IEnumerable<ErrorAstNode> Collect(AstNode root)
        {
            this.Visit(root);
            return _errors;
        }

        public override object Visit(AstNode node)
        {
            var result = node.Accept(this);
            VisitChildren(node);
            return result;
        }

        public override object VisitError(ErrorAstNode node)
        {
            _errors.Add(node);
            return null;
        }
    }
}