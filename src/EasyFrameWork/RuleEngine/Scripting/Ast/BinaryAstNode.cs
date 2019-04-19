/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */

using System.Collections.Generic;
using Easy.RuleEngine.Scripting.Compiler;

namespace Easy.RuleEngine.Scripting.Ast
{
    public class BinaryAstNode : AstNode, IAstNodeWithToken
    {
        private readonly AstNode _left;
        private readonly Token _token;
        private readonly AstNode _right;

        public BinaryAstNode(AstNode left, Token token, AstNode right)
        {
            _left = left;
            _token = token;
            _right = right;
        }

        public Token Token
        {
            get { return _token; }
        }

        public Token Operator
        {
            get { return _token; }
        }

        public override object Accept(AstVisitor visitor)
        {
            return visitor.VisitBinary(this);
        }

        public override IEnumerable<AstNode> Children
        {
            get
            {
                return new List<AstNode>(2) { _left, _right };
            }
        }

        public AstNode Left { get { return _left; } }

        public AstNode Right { get { return _right; } }
    }
}