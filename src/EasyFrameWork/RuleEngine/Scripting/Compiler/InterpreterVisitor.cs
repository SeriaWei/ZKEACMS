/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */

using System;
using System.Linq;
using Easy.RuleEngine.Scripting.Ast;

namespace Easy.RuleEngine.Scripting.Compiler
{
    public class InterpreterVisitor : AstVisitor
    {
        private readonly EvaluationContext _context;

        public InterpreterVisitor(EvaluationContext context)
        {
            _context = context;
        }

        public EvaluationResult Evaluate()
        {
            return Evaluate(_context.Tree.Root);
        }

        private EvaluationResult Evaluate(AstNode node)
        {
            return (EvaluationResult)this.Visit(node);
        }

        public override object VisitConstant(ConstantAstNode node)
        {
            return Result(node.Value);
        }

        public override object VisitUnary(UnaryAstNode node)
        {
            var operandValue = Evaluate(node.Operand);
            if (operandValue.IsError)
                return operandValue;

            switch (node.Operator.Kind)
            {
                case TokenKind.Not:
                case TokenKind.NotSign:
                    var operandBoolValue = ConvertToBool(operandValue);
                    if (operandBoolValue.IsError)
                        return operandBoolValue;

                    return Result(!operandBoolValue.BoolValue);
                default:
                    throw new InvalidOperationException(string.Format("Internal error: unary operator '{0}' is not supported.", node.Token.Kind));
            }
        }

        public override object VisitBinary(BinaryAstNode node)
        {
            var left = Evaluate(node.Left);
            if (left.IsError)
                return left;

            var right = Evaluate(node.Right);
            if (right.IsError)
                return right;
           
            switch (node.Token.Kind)
            {
                case TokenKind.Plus:
                    return EvaluateArithmetic(left, right, (a, b) => Result(a.MoneyValue + b.MoneyValue));
                case TokenKind.Minus:
                    return EvaluateArithmetic(left, right, (a, b) => Result(a.MoneyValue - b.MoneyValue));
                case TokenKind.Mul:
                    return EvaluateArithmetic(left, right, (a, b) => Result(a.MoneyValue * b.MoneyValue));
                case TokenKind.Div:
                    return EvaluateArithmetic(left, right, (a, b) => b.MoneyValue == 0 ? Error("Attempted to divide by zero.") : Result(a.MoneyValue / b.MoneyValue));
                case TokenKind.And:
                case TokenKind.AndSign:
                    return EvaluateLogicalAnd(left, right);
                case TokenKind.Or:
                case TokenKind.OrSign:
                    return EvaluateLogicalOr(left, right);
                case TokenKind.EqualEqual:
                    return EvaluateEquality(left, right, v => v);
                case TokenKind.NotEqual:
                    return EvaluateEquality(left, right, v => !v);
                case TokenKind.LessThan:
                    return EvaluateComparison(left, right, v => v < 0);
                case TokenKind.LessThanEqual:
                    return EvaluateComparison(left, right, v => v <= 0);
                case TokenKind.GreaterThan:
                    return EvaluateComparison(left, right, v => v > 0);
                case TokenKind.GreaterThanEqual:
                    return EvaluateComparison(left, right, v => v >= 0);

                default:
                    throw new InvalidOperationException(string.Format("Internal error: binary operator '{0}' is not supported.", node.Token.Kind));
            }
        }

        public override object VisitMethodCall(MethodCallAstNode node)
        {
            var arguments = node.Arguments.Select(arg => Evaluate(arg)).ToList();
            if (arguments.Any(arg => arg.IsError))
                return arguments.First(arg => arg.IsError);

            return Result(_context.MethodInvocationCallback((string)node.Target.Value, arguments.Select(arg => arg.Value).ToList()));
        }

        public override object VisitError(ErrorAstNode node)
        {
            return Error(node.Message);
        }

        private static EvaluationResult EvaluateEquality(EvaluationResult left, EvaluationResult right, Func<bool, bool> operation)
        {
            var type = PrimitiveType.InstanceFor(left.Value);
            var result = type.EqualityOperator(left, right);
            if (result.IsBool)
                return Result(operation(result.BoolValue));
            return result;
        }

        private static EvaluationResult EvaluateComparison(EvaluationResult left, EvaluationResult right, Func<int, bool> operation)
        {
            var type = PrimitiveType.InstanceFor(left.Value);
            var result = type.ComparisonOperator(left, right);
            if (result.IsInt32)
                return Result(operation(result.Int32Value));
            return result;
        }

        private static EvaluationResult EvaluateArithmetic(EvaluationResult left, EvaluationResult right,
            Func<EvaluationResult, EvaluationResult, EvaluationResult> operation)
        {
            //TODO: Proper type conversion
            var leftValue = ConvertToMoney(left);
            if (leftValue.IsError)
                return leftValue;

            var rightValue = ConvertToMoney(right);
            if (rightValue.IsError)
                return rightValue;

            return operation(leftValue, rightValue);
        }

        private EvaluationResult EvaluateLogicalAnd(EvaluationResult left, EvaluationResult right)
        {
            var type = PrimitiveType.InstanceFor(left.Value);
            return type.LogicalAnd(left, right);
        }

        private EvaluationResult EvaluateLogicalOr(EvaluationResult left, EvaluationResult right)
        {
            var type = PrimitiveType.InstanceFor(left.Value);
            return type.LogicalOr(left, right);
        }

        private static EvaluationResult ConvertToMoney(EvaluationResult value)
        {
            //TODO: Proper type conversion
            if (value.IsInt32 || value.IsMoney)
                return value;

            return Error(string.Format("Value '{0}' is not convertible to an integer.", value));
        }

        private static EvaluationResult ConvertToBool(EvaluationResult value)
        {
            //TODO: Proper type conversion
            if (value.IsBool)
                return value;

            return Error(string.Format("Value '{0}' is not convertible to a boolean.", value));
        }

        private static EvaluationResult Result(object value)
        {
            return EvaluationResult.Result(value);
        }

        private static EvaluationResult Error(string message)
        {
            return EvaluationResult.Error(message);
        }
    }
}