/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using DocumentFormat.OpenXml.Wordprocessing;
using Easy.Extend;
using FastExpressionCompiler;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text.RegularExpressions;

namespace Easy.Reflection
{
    public static partial class PropertyHelper
    {
        private static ConcurrentDictionary<Type, ConcurrentDictionary<string, Func<object, object>>> _propertyGetters = new ConcurrentDictionary<Type, ConcurrentDictionary<string, Func<object, object>>>();
        private static ConcurrentDictionary<Type, ConcurrentDictionary<string, Action<object, object>>> _propertySetters = new ConcurrentDictionary<Type, ConcurrentDictionary<string, Action<object, object>>>();
        private static ConcurrentDictionary<Type, Func<object, object, object>> _indexGetters = new ConcurrentDictionary<Type, Func<object, object, object>>();
        private static ConcurrentDictionary<Type, Action<object, object, object>> _indexSetters = new ConcurrentDictionary<Type, Action<object, object, object>>();


        [GeneratedRegex("^\\[(\\d+)\\]$")]
        private static partial Regex RegexOnlyNumberIndex();
        [GeneratedRegex("^\\[\"([A-Za-z0-9_]+)\"\\]$")]
        private static partial Regex RegexOnlyNameIndex();
        [GeneratedRegex("^([A-Za-z0-9_]+)\\[(\\d+)\\]$")]
        private static partial Regex RegexNumberIndex();
        [GeneratedRegex("^([A-Za-z0-9_]+)\\[\"([A-Za-z0-9_]+)\"\\]$")]
        private static partial Regex RegexNameIndex();

        public class PropertyName
        {
            public PropertyName(string name, object index)
            {
                Name = name;
                Index = index;
            }
            public string Name { get; set; }
            public object Index { get; set; }
        }
        static List<Func<string, PropertyName>> _arrayPropertyParsers = new List<Func<string, PropertyName>>
        {
            static propertyExpression =>
            {
                var numberMatch = RegexOnlyNumberIndex().Match(propertyExpression);
                if (numberMatch.Success)
                {
                    return new PropertyName(null, int.Parse(numberMatch.Groups[1].Value));
                }
                return null;
            },
            static propertyExpression =>
            {
                var numberMatch = RegexOnlyNameIndex().Match(propertyExpression);
                if (numberMatch.Success)
                {
                    return new PropertyName(null, numberMatch.Groups[1].Value);
                }
                return null;
            },
            static propertyExpression =>
            {
                var numberMatch = RegexNumberIndex().Match(propertyExpression);
                if (numberMatch.Success)
                {
                    return new PropertyName(numberMatch.Groups[1].Value, int.Parse(numberMatch.Groups[2].Value));
                }
                return null;
            },
            static propertyExpression =>
            {
                var numberMatch = RegexNameIndex().Match(propertyExpression);
                if (numberMatch.Success)
                {
                    return new PropertyName(numberMatch.Groups[1].Value, numberMatch.Groups[2].Value);
                }
                return null;
            },
            static propertyExpression => new PropertyName(propertyExpression, null)
        };


        public static PropertyName[] ParseProperties(string propertyExpression)
        {
            var propertyDeepArray = propertyExpression.Split('.', StringSplitOptions.RemoveEmptyEntries);

            PropertyName[] properties = new PropertyName[propertyDeepArray.Length];
            for (int i = 0; i < propertyDeepArray.Length; i++)
            {
                string item = propertyDeepArray[i];
                foreach (var parseProperty in _arrayPropertyParsers)
                {
                    var propertyResult = parseProperty(item);
                    if (propertyResult == null) continue;

                    properties[i] = propertyResult;
                    break;
                }
            }
            return properties;
        }

        public static object GetValue(object inputValue, string propertyExpression)
        {
            if (inputValue is null)
            {
                throw new ArgumentNullException(nameof(inputValue));
            }

            if (propertyExpression is null)
            {
                throw new ArgumentNullException(nameof(propertyExpression));
            }

            object resultValue = inputValue;

            foreach (var parseProperty in ParseProperties(propertyExpression))
            {
                resultValue = GetPropertyValue(resultValue, parseProperty);
            }

            return resultValue;
        }

        public static void SetValue(object inputValue, string propertyExpression, object value)
        {
            if (inputValue is null)
            {
                throw new ArgumentNullException(nameof(inputValue));
            }

            if (propertyExpression is null)
            {
                throw new ArgumentNullException(nameof(propertyExpression));
            }

            var propertites = ParseProperties(propertyExpression);

            object resultValue = inputValue;
            for (int i = 0; i < propertites.Length; i++)
            {
                var propertyResult = propertites[i];

                if (i < propertites.Length - 1)
                {
                    resultValue = GetPropertyValue(resultValue, propertyResult);
                    continue;
                }

                if (propertyResult.Index == null)
                {
                    var setter = GetPropertySetterDelegate(resultValue.GetType(), propertyResult.Name);
                    setter(resultValue, value);
                }
                else
                {
                    resultValue = GetPropertyValue(resultValue, new PropertyName(propertyResult.Name, null));

                    var valueType = resultValue.GetType();
                    Action<object, object, object> setter = null;
                    if (_indexSetters.TryGetValue(valueType, out setter))
                    {
                        setter(resultValue, propertyResult.Index, value);
                        return;
                    }
                    if (valueType.IsArray)
                    {
                        setter = GetIndexSetterDelegate(valueType, propertyResult.Index.GetType(), null, valueType.GetElementType());
                    }
                    else
                    {
                        var indexProperty = valueType.GetProperty("Item");
                        if (indexProperty != null && indexProperty.GetIndexParameters().Length > 0)
                        {
                            setter = GetIndexSetterDelegate(resultValue.GetType(), propertyResult.Index.GetType(), indexProperty, null);
                        }
                    }
                    if (setter == null) return;

                    setter(resultValue, propertyResult.Index, value);
                }

            }
        }

        private static object GetPropertyValue(object resultValue, PropertyName propertyResult)
        {
            object result = null;

            if (propertyResult.Name.IsNotNullAndWhiteSpace())
            {
                var valueGetter = GetPropertyGetterDelegate(resultValue.GetType(), propertyResult.Name);
                if (valueGetter == null) return null;

                result = valueGetter(resultValue);

                if (result == null) return null;

                if (propertyResult.Index == null) return result;
            }
            else if (propertyResult.Index != null)
            {
                result = resultValue;
            }


            var valueType = result.GetType();
            if (_indexGetters.TryGetValue(valueType, out var getter))
            {
                return getter(result, propertyResult.Index);
            }

            if (valueType.IsArray)
            {
                Func<object, object, object> indexAccessor = GetIndexGetterDelegate(valueType, propertyResult.Index.GetType(), null);
                return indexAccessor(result, propertyResult.Index);
            }
            else
            {
                var indexProperty = valueType.GetProperty("Item");
                if (indexProperty != null && indexProperty.GetIndexParameters().Length > 0)
                {
                    Func<object, object, object> indexAccessor = GetIndexGetterDelegate(valueType, propertyResult.Index.GetType(), indexProperty);
                    return indexAccessor(result, propertyResult.Index);
                }
            }
            return null;
        }

        private static Func<object, object> GetPropertyGetterDelegate(Type valueType, string propertyName)
        {
            var typeDelegates = _propertyGetters.GetOrAdd(valueType, t => new ConcurrentDictionary<string, Func<object, object>>());

            return typeDelegates.GetOrAdd(propertyName, p =>
            {
                var objPara = Expression.Parameter(typeof(object), "m");
                var paraToTypeValue = Expression.Convert(objPara, valueType);
                Expression expProperty = Expression.Property(paraToTypeValue, propertyName);
                Expression propertyToObject = Expression.Convert(expProperty, typeof(object));
                var propertyDelegateExpression = Expression.Lambda<Func<object, object>>(propertyToObject, objPara);
                return propertyDelegateExpression.CompileFast();
            });
        }

        private static Func<object, object, object> GetIndexGetterDelegate(Type valueType, Type indexType, PropertyInfo indexProperty)
        {
            return _indexGetters.GetOrAdd(valueType, v =>
            {
                var parameter = Expression.Parameter(typeof(object), "m");
                var parameterKey = Expression.Parameter(typeof(object), "k");
                var indexExp = Expression.MakeIndex(Expression.Convert(parameter, valueType), indexProperty, new[] { Expression.Convert(parameterKey, indexType) });
                var dictionaryAccessor = Expression.Lambda<Func<object, object, object>>(Expression.Convert(indexExp, typeof(object)), new[] { parameter, parameterKey }).CompileFast();
                return dictionaryAccessor;
            });

        }

        private static Action<object, object> GetPropertySetterDelegate(Type targetObjectType, string propertyName)
        {
            var typeDelegates = _propertySetters.GetOrAdd(targetObjectType, t => new ConcurrentDictionary<string, Action<object, object>>());

            return typeDelegates.GetOrAdd(propertyName, p =>
            {//build m.Name=v
                var objPara = Expression.Parameter(typeof(object), "m");
                var valuePara = Expression.Parameter(typeof(object), "v");
                var paraToTypeValue = Expression.Convert(objPara, targetObjectType);
                var propertyInfo = targetObjectType.GetProperty(propertyName);
                var expProperty = Expression.Property(paraToTypeValue, propertyInfo);
                var setValueExp = Expression.Assign(expProperty, Expression.Convert(valuePara, propertyInfo.PropertyType));
                var lambda = Expression.Lambda<Action<object, object>>(setValueExp, objPara, valuePara);
                return lambda.CompileFast();
            });
        }
        private static Action<object, object, object> GetIndexSetterDelegate(Type arrayType, Type indexType, PropertyInfo indexProperty, Type valueType)
        {
            return _indexSetters.GetOrAdd(arrayType, v =>
            {//build m[0]=v;
                var parameter = Expression.Parameter(typeof(object), "m");
                var parameterKey = Expression.Parameter(typeof(object), "k");
                var valuePara = Expression.Parameter(typeof(object), "v");
                var indexExp = Expression.MakeIndex(Expression.Convert(parameter, arrayType), indexProperty, new[] { Expression.Convert(parameterKey, indexType) });
                var lambda = Expression.Assign(indexExp, Expression.Convert(valuePara, indexProperty?.PropertyType ?? valueType));
                return Expression.Lambda<Action<object, object, object>>(lambda, parameter, parameterKey, valuePara).CompileFast();
            });

        }
    }
}
