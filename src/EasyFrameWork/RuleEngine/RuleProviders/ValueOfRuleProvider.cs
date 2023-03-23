/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections;
using System.Collections.Concurrent;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;

namespace Easy.RuleEngine.RuleProviders
{
    public class ValueOfRuleProvider : IRuleProvider
    {
        private static ConcurrentDictionary<Type, ConcurrentDictionary<string, Func<object, object>>> _propertyDelegates = new ConcurrentDictionary<Type, ConcurrentDictionary<string, Func<object, object>>>();
        private static ConcurrentDictionary<Type, Func<object, object, object>> _indexDelegates = new ConcurrentDictionary<Type, Func<object, object, object>>();

        const string FunctionName = "ValueOf";
        public void Process(RuleContext ruleContext, object workContext)
        {
            if (ruleContext.FunctionName.Equals(FunctionName) && workContext != null)
            {
                if (ruleContext.Arguments[0] is string)
                {
                    var property = workContext.GetType().GetProperty(ruleContext.Arguments[0].ToString());
                    if (property != null)
                    {
                        ruleContext.Result = property.GetValue(workContext);
                        if (ruleContext.Result is IEnumerable && ruleContext.Arguments.Length == 2)
                        {
                            int index = Convert.ToInt32(ruleContext.Arguments[1]);
                            int i = 0;
                            object resultAt = null;
                            foreach (var item in ruleContext.Result as IEnumerable)
                            {
                                if (i == index)
                                {
                                    resultAt = item;
                                    break;
                                }
                                i++;
                            }
                            ruleContext.Result = resultAt;
                        }
                    }
                }

            }
        }
        private Func<object, object, object> GetIndexDelegate(Type valueType, Type indexType, PropertyInfo indexProperty)
        {
            return _indexDelegates.GetOrAdd(valueType, v =>
            {
                var parameter = Expression.Parameter(typeof(object), "m");
                var parameterKey = Expression.Parameter(typeof(object), "k");
                var indexExp = Expression.MakeIndex(Expression.Convert(parameter, valueType), indexProperty, new[] { Expression.Convert(parameterKey, indexType) });
                var dictionaryAccessor = (Func<object, object, object>)Expression.Lambda(Expression.Convert(indexExp, typeof(object)), new[] { parameter, parameterKey }).Compile();
                return dictionaryAccessor;
            });

        }
        private object GetPropertyValue(object inputValue, object[] arguments)
        {
            string propertyName = arguments[0].ToString();

            var propertyAccessor = GetPropertyDelegate(inputValue, propertyName);

            var result = propertyAccessor(inputValue);

            if (arguments.Length > 1)
            {
                var valueType = result.GetType();
                var indexProperty = valueType.GetProperty("Item");
                if (valueType.IsArray || (indexProperty != null && indexProperty.GetIndexParameters().Length > 0))
                {//Array or Anyother type that can get value by index. For example: List<T>, Dictionary<,>
                    Func<object, object, object> indexAccessor = GetIndexDelegate(valueType, arguments[1].GetType(), indexProperty);
                    return indexAccessor(result, arguments[1]);
                }
            }
            return result;
        }

        private Func<object, object> GetPropertyDelegate(object value, string propertyName)
        {
            Type type = value.GetType();
            var typeDelegates = _propertyDelegates.GetOrAdd(type, t => new ConcurrentDictionary<string, Func<object, object>>());
            return typeDelegates.GetOrAdd(propertyName, p =>
            {
                var objPara = Expression.Parameter(typeof(object), "m");
                var paraToTypeValue = Expression.Convert(objPara, type);
                Expression expProperty = Expression.Property(paraToTypeValue, propertyName);
                Expression propertyToObject = Expression.Convert(expProperty, typeof(object));
                var propertyDelegateExpression = Expression.Lambda(propertyToObject, objPara);
                return (Func<object, object>)propertyDelegateExpression.Compile();
            });
        }
    }
}
