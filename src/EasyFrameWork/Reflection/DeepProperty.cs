/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Extend;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;

namespace Easy.Reflection
{
    public class DeepProperty
    {
        static Regex _arrayPropertyRegex = new Regex(@"([A-Za-z0-9_]+)\[(\d+)\]", RegexOptions.Compiled);
        public string Name { get; set; }
        public int? Index { get; set; }
        public static DeepProperty ParseProperty(string property)
        {
            var match = _arrayPropertyRegex.Match(property);
            if (match.Success)
            {
                return new DeepProperty
                {
                    Name = match.Groups[1].Value,
                    Index = int.Parse(match.Groups[2].Value)
                };
            }
            else
            {
                return new DeepProperty { Name = property };
            }
        }
        public static IEnumerable<DeepProperty> ParseProperties(string descriptor)
        {
            var allProperties = descriptor.Split('.');
            foreach (var property in allProperties)
            {
                yield return ParseProperty(property);
            }
        }
        /// <summary>
        /// Set value to an object property.
        /// </summary>
        /// <param name="targetObj">Target object</param>
        /// <param name="propertyDescriptor">Property descriptor. Entity.Name, Entity.Images[0].Src</param>
        /// <param name="value">Value</param>
        public static void SetValue(object targetObj, string propertyDescriptor, object value)
        {
            if (targetObj is null)
            {
                throw new ArgumentNullException(nameof(targetObj));
            }

            if (propertyDescriptor is null)
            {
                throw new ArgumentNullException(nameof(propertyDescriptor));
            }

            var target = targetObj;
            var typeInfo = target.GetType().GetTypeInfo();
            var properties = ParseProperties(propertyDescriptor).ToList();
            for (int i = 0; i < properties.Count; i++)
            {
                var item = properties[i];
                if (i < properties.Count - 1)
                {
                    var pInfo = typeInfo.GetProperty(item.Name);
                    if (item.Index.HasValue)
                    {
                        target = pInfo.GetValue(target);
                        int index = 0;
                        foreach (var objItem in (target as IEnumerable))
                        {
                            if (index == item.Index)
                            {
                                target = objItem;
                                break;
                            }
                            index++;
                        }
                    }
                    else
                    {
                        target = pInfo.GetValue(target);
                    }
                    typeInfo = target.GetType().GetTypeInfo();
                }
                else
                {
                    if (item.Index.HasValue)
                    {
                        var property = typeInfo.GetProperty(item.Name);
                        if (property.GetIndexParameters().Length > 0)
                        {
                            property.SetValue(target, value, new object[] { item.Index.Value });
                        }
                        else
                        {
                            var valueArray = property.GetValue(target);
                            if (valueArray is Array array)
                            {
                                array.SetValue(value, item.Index.Value);
                            }
                            else if (valueArray is IList list)
                            {
                                list[item.Index.Value] = value;
                            }
                        }
                    }
                    else
                    {
                        typeInfo.GetProperty(item.Name).SetValue(target, value);
                    }
                }

            }
        }
    }
}
