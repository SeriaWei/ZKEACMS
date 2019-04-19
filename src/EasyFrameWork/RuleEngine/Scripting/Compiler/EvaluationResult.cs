/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */

using System;

namespace Easy.RuleEngine.Scripting.Compiler
{
    public class EvaluationResult
    {
        private readonly object _value;

        public EvaluationResult(object value)
        {
            _value = value;
        }

        public static EvaluationResult Result(object value)
        {
            if (value is EvaluationResult)
                throw new InvalidOperationException("Internal error: value cannot be an evaluation result.");
            return new EvaluationResult(value);
        }

        public static EvaluationResult Error(string message)
        {
            return new EvaluationResult(new Error { Message = message });
        }

        public object Value { get { return _value; } }

        public bool IsError { get { return Value is Error; } }
        public bool IsNil { get { return IsNull; } }
        public bool IsNull { get { return Value == null; } }
        public bool IsBool { get { return Value is bool; } }
        public bool IsInt32 { get { return Value is int; } }
        public bool IsMoney { get { return Value is decimal; } }
        public bool IsString { get { return Value is string; } }
        public bool IsDateTime { get { return Value is DateTime; } }
        public Error ErrorValue { get { return (Error)Value; } }
        public bool BoolValue { get { return (bool)Value; } }
        public int Int32Value { get { return (int)Value; } }
        public decimal MoneyValue { get { return Convert.ToDecimal(Value); } }
        public DateTime DateTimeValue { get { return (DateTime)Value; } }
        public string StringValue { get { return (string)Value; } }

        public override string ToString()
        {
            return IsNull ? "<null>" : Value.ToString();
        }
    }

    public class Error
    {
        public string Message { get; set; }
        public Exception Exception { get; set; }

        public override string ToString()
        {
            return string.Format("Error: {0}", Message);
        }
    }
}