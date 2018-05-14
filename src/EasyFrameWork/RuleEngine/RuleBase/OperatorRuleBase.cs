using System;
using System.Collections;
using System.Linq;

namespace Easy.RuleEngine
{
    public class OperatorRuleBase : IRuleProvider
    {

        public const string ValueEquals = "Equals";
        public const string NotEquals = "NotEquals";
        public const string StartsWith = "StartsWith";
        public const string Contains = "Contains";
        public const string NotStartsWith = "NotStartsWith";
        public const string NotContains = "NotContains";
        public const string GreaterThan = "GreaterThan";
        public const string LessThan = "LessThan";
        public const string IsBlank = "IsBlank";
        public const string IsNotBlank = "IsNotBlank";
        public const string In = "In";


        public virtual void Process(RuleContext ruleContext, object workContext)
        {
            var testValue = ruleContext.Arguments[0];
            bool result = false;
            if (testValue is string)
            {
                string tryValue = testValue as string;
                string condition = ruleContext.Arguments[1] as string;
                switch (ruleContext.FunctionName)
                {
                    case ValueEquals:
                        {
                            result = string.Equals(condition, tryValue, StringComparison.InvariantCultureIgnoreCase);
                            break;
                        }
                    case NotEquals:
                        result = !string.Equals(condition, tryValue, StringComparison.InvariantCultureIgnoreCase);
                        break;
                    case StartsWith:
                        result = tryValue.StartsWith(condition, StringComparison.InvariantCultureIgnoreCase);
                        break;
                    case Contains:
                        result = tryValue.IndexOf(condition, StringComparison.InvariantCultureIgnoreCase) >= 0;
                        break;
                    case NotStartsWith:
                        result = !tryValue.StartsWith(condition, StringComparison.InvariantCultureIgnoreCase);
                        break;
                    case NotContains:
                        result = tryValue.IndexOf(condition, StringComparison.InvariantCultureIgnoreCase) < 0;
                        break;
                    case In:
                        {
                            var conditionCollection = condition.ToLower().Split(',', ';');
                            result = conditionCollection.AsEnumerable().Contains(tryValue.ToLower());
                            break;
                        }
                    case IsBlank:
                        {
                            result = string.IsNullOrWhiteSpace(tryValue);
                            break;
                        }
                    case IsNotBlank:
                        {
                            result = !string.IsNullOrWhiteSpace(tryValue);
                            break;
                        }
                }
            }
            else if (testValue is IEnumerable)
            {
                var tryValues = testValue as IEnumerable;
                var condition = ruleContext.Arguments[1] as string ?? string.Empty;
                switch (ruleContext.FunctionName)
                {
                    case ValueEquals:
                        {
                            foreach (var tryValue in tryValues)
                            {
                                result = string.Equals(condition, tryValue.ToString(), StringComparison.InvariantCultureIgnoreCase);
                                if (result)
                                    break;
                            }

                            break;
                        }
                    case NotEquals:
                        {
                            result = true;
                            foreach (var tryValue in tryValues)
                            {
                                var tmp = string.Equals(condition, tryValue.ToString(), StringComparison.InvariantCultureIgnoreCase);
                                if (tmp)
                                {
                                    result = false;
                                    break;
                                }
                            }

                            break;
                        }

                    case StartsWith:
                        {
                            foreach (var tryValue in tryValues)
                            {
                                result = tryValue.ToString().StartsWith(condition, StringComparison.InvariantCultureIgnoreCase);
                                if (result)
                                    break;
                            }

                            break;
                        }
                    case Contains:
                        {
                            foreach (var tryValue in tryValues)
                            {
                                result = tryValue.ToString().IndexOf(condition, StringComparison.InvariantCultureIgnoreCase) >= 0;
                                if (result)
                                    break;
                            }

                            break;
                        }
                    case NotStartsWith:
                        {
                            result = true;
                            foreach (var tryValue in tryValues)
                            {
                                var tmp = tryValue.ToString().StartsWith(condition, StringComparison.InvariantCultureIgnoreCase);
                                if (tmp)
                                {
                                    result = false;
                                    break;
                                }
                            }

                            break;
                        }
                    case NotContains:
                        {
                            result = true;
                            foreach (var tryValue in tryValues)
                            {
                                var tmp = tryValue.ToString().IndexOf(condition, StringComparison.InvariantCultureIgnoreCase) >= 0;
                                if (tmp)
                                {
                                    result = false;
                                    break;
                                }
                            }

                            break;
                        }
                    case In:
                        {
                            var conditionCollection = condition.ToLower().Split(',', ';');
                            foreach (var tryValue in tryValues)
                            {
                                result = conditionCollection.AsEnumerable().Contains(tryValue.ToString().ToLower());
                                if (result)
                                    break;
                            }

                            break;
                        }
                    case IsBlank:
                        {
                            result = true;
                            foreach (var tryValue in tryValues)
                            {
                                var tmp = !string.IsNullOrWhiteSpace(tryValue.ToString());
                                if (tmp)
                                {
                                    result = false;
                                    break;
                                }
                            }

                            break;
                        }
                    case IsNotBlank:
                        {
                            foreach (var tryValue in tryValues)
                            {
                                result = !string.IsNullOrWhiteSpace(tryValue.ToString());
                                if (result)
                                    break;
                            }

                            break;
                        }
                }
            }

            ruleContext.Result = result;
        }
    }
}