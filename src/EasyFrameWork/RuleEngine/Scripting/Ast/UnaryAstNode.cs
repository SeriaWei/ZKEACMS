/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */

using System.Collections.Generic;
using Easy.RuleEngine.Scripting.Compiler;

namespace Easy.RuleEngine.Scripting.Ast
{
    public class UnaryAstNode : AstNode, IAstNodeWithToken
    {
        private readonly AstNode _operand;
        private readonly Token _token;

        public UnaryAstNode(Token token, AstNode operand)
        {
            _operand = operand;
            _token = token;
        }

        public Token Token { get { return _token; } }
        public Token Operator { get { return _token; } }
        public AstNode Operand { get { return _operand; } }

        public override IEnumerable<AstNode> Children
        {
            get
            {
                return new List<AstNode>(1) { _operand };
            }
        }

        public override object Accept(AstVisitor visitor)
        {
            return visitor.VisitUnary(this);
        }
    }
}