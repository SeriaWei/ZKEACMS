/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */

using System.Collections.Generic;
using Easy.RuleEngine.Scripting.Compiler;

namespace Easy.RuleEngine.Scripting.Ast
{
    public class MethodCallAstNode : AstNode, IAstNodeWithToken
    {
        private readonly Token _token;
        private readonly IList<AstNode> _arguments;

        public MethodCallAstNode(Token token, IList<AstNode> arguments)
        {
            _token = token;
            _arguments = arguments;
        }

        public Token Target { get { return _token; } }
        public IList<AstNode> Arguments { get { return _arguments; } }

        public Token Token { get { return _token; } }

        public override IEnumerable<AstNode> Children
        {
            get { return _arguments; }
        }

        public override object Accept(AstVisitor visitor)
        {
            return visitor.VisitMethodCall(this);
        }
    }
}