/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */

using System.Linq;

namespace Easy.RuleEngine.Scripting.Ast
{
    public class AstVisitor
    {
        public virtual object Visit(AstNode node)
        {
            return node.Accept(this);
        }

        public virtual object VisitChildren(AstNode node)
        {
            return node.Children.Aggregate<AstNode, object>(null, (prev, child) => Visit(child));
        }

        public virtual object VisitBinary(BinaryAstNode node)
        {
            return null;
        }

        public virtual object VisitConstant(ConstantAstNode node)
        {
            return null;
        }

        public virtual object VisitError(ErrorAstNode node)
        {
            return null;
        }

        public virtual object VisitUnary(UnaryAstNode node)
        {
            return null;
        }

        public virtual object VisitMethodCall(MethodCallAstNode node)
        {
            return null;
        }
    }
}