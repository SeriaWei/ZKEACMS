/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System.Linq.Expressions;

namespace Easy.Reflection
{
    public static class LinqExpression
    {
        public static string GetPropertyName(Expression expression)
        {
            if (expression.NodeType == ExpressionType.Convert ||
                expression.NodeType == ExpressionType.ConvertChecked)
            {
                var exp = (((UnaryExpression)expression).Operand as MemberExpression);
                if (exp != null)
                {
                    return exp.Member.Name;
                }
            }
            var memberExp = expression as MemberExpression;
            if (memberExp != null)
            {
                return memberExp.Member.Name;
            }
            return "";
        }      
        
    }
}
