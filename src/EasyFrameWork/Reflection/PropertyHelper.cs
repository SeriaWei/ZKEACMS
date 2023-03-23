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
    public static class PropertyHelper
    {
        private static ConcurrentDictionary<Type, ConcurrentDictionary<string, Func<object, object>>> _propertyGetters = new ConcurrentDictionary<Type, ConcurrentDictionary<string, Func<object, object>>>();
        private static ConcurrentDictionary<Type, Func<object, object, object>> _indexGetters = new ConcurrentDictionary<Type, Func<object, object, object>>();

        static Regex _numberIndexRegex = new Regex(@"^([A-Za-z0-9_]+)\[(\d+)\]$", RegexOptions.Compiled);
        static Regex _nameIndexRegex = new Regex(@"^([A-Za-z0-9_]+)\[""([A-Za-z0-9_]+)""\]$", RegexOptions.Compiled);
        class PropertyName
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
                var numberMatch = _numberIndexRegex.Match(propertyExpression);
                if (numberMatch.Success)
                {
                    return new PropertyName(numberMatch.Groups[1].Value,int.Parse(numberMatch.Groups[2].Value));
                }
                return null;
            },
            static propertyExpression =>
            {
                var numberMatch = _nameIndexRegex.Match(propertyExpression);
                if (numberMatch.Success)
                {
                    return new PropertyName(numberMatch.Groups[1].Value,numberMatch.Groups[2].Value);
                }
                return null;
            },
            static propertyExpression => new PropertyName(propertyExpression, null)
        };

        public static object GetPropertyValue(object inputValue, string propertyExpression)
        {
            var propertites = propertyExpression.Split('.', StringSplitOptions.RemoveEmptyEntries);

            object resultValue = inputValue;

            foreach (var item in propertites)
            {
                foreach (var parser in _arrayPropertyParsers)
                {
                    var propertyResult = parser(item);
                    if (propertyResult == null) continue;

                    var valueGetter = GetPropertyGetterDelegate(resultValue.GetType(), propertyResult.Name);
                    if (valueGetter == null) return null;
                    resultValue = valueGetter(resultValue);
                    
                    if (resultValue == null) return null;

                    if (propertyResult.Index != null)
                    {
                        var valueType = resultValue.GetType();
                        var indexProperty = valueType.GetProperty("Item");
                        if (valueType.IsArray || (indexProperty != null && indexProperty.GetIndexParameters().Length > 0))
                        {//Array or Anyother type that can get value by index. For example: List<T>, Dictionary<,>
                            Func<object, object, object> indexAccessor = GetIndexGetterDelegate(valueType, propertyResult.Index.GetType(), indexProperty);
                            resultValue = indexAccessor(resultValue, propertyResult.Index);
                        }
                        else
                        {
                            return null;
                        }
                    }
                    break;
                }
            }
            return resultValue;
        }

        private static Func<object, object, object> GetIndexGetterDelegate(Type valueType, Type indexType, PropertyInfo indexProperty)
        {
            return _indexGetters.GetOrAdd(valueType, v =>
            {
                var parameter = Expression.Parameter(typeof(object), "m");
                var parameterKey = Expression.Parameter(typeof(object), "k");
                var indexExp = Expression.MakeIndex(Expression.Convert(parameter, valueType), indexProperty, new[] { Expression.Convert(parameterKey, indexType) });
                var dictionaryAccessor = (Func<object, object, object>)Expression.Lambda(Expression.Convert(indexExp, typeof(object)), new[] { parameter, parameterKey }).CompileFast();
                return dictionaryAccessor;
            });

        }
        private static Func<object, object> GetPropertyGetterDelegate(Type valueType, string propertyName)
        {
            var typeDelegates = _propertyGetters.GetOrAdd(valueType, t => new ConcurrentDictionary<string, Func<object, object>>());
            try
            {
                return typeDelegates.GetOrAdd(propertyName, p =>
                {
                    var objPara = Expression.Parameter(typeof(object), "m");
                    var paraToTypeValue = Expression.Convert(objPara, valueType);
                    Expression expProperty = Expression.Property(paraToTypeValue, propertyName);
                    Expression propertyToObject = Expression.Convert(expProperty, typeof(object));
                    var propertyDelegateExpression = Expression.Lambda(propertyToObject, objPara);
                    return (Func<object, object>)propertyDelegateExpression.CompileFast();
                });
            }
            catch
            {
                return null;
            }
        }


        
    }
}
