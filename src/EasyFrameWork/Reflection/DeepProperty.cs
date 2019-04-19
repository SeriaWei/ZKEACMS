/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
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
        public string Name { get; set; }
        public int? Index { get; set; }
        static int? TrimIndex(ref string property)
        {
            int? index = null;
            property = Regex.Replace(property, @"([A-Za-z0-9_]+)\[(\d+)\]?", new MatchEvaluator(match =>
            {
                index = int.Parse(match.Groups[2].Value);
                return match.Groups[1].Value;
            }));
            return index;
        }
        static IEnumerable<DeepProperty> Generate(string descriptor)
        {
            var deeps = descriptor.Split('.');
            foreach (var property in deeps)
            {
                string p = property;
                int? index = TrimIndex(ref p);
                yield return new DeepProperty { Name = p, Index = index };
            }
        }

        public static void SetValue(object obj, string propertyDescriptor, object value)
        {
            var typeInfo = obj.GetType().GetTypeInfo();
            var properties = Generate(propertyDescriptor).ToList();
            object lastObj = obj;
            for (int i = 0; i < properties.Count; i++)
            {
                var item = properties[i];
                if (i < properties.Count - 1)
                {
                    var pInfo = typeInfo.GetProperty(item.Name);
                    if (item.Index.HasValue)
                    {
                        obj = pInfo.GetValue(obj);
                        if (item.Index.HasValue)
                        {
                            int index = 0;
                            foreach (var objItem in (obj as IEnumerable))
                            {
                                if (index == item.Index)
                                {
                                    obj = objItem;
                                    break;
                                }
                                index++;
                            }
                        }
                    }
                    else
                    {
                        obj = pInfo.GetValue(obj);
                    }
                    typeInfo = obj.GetType().GetTypeInfo();
                }
                else
                {
                    typeInfo.GetProperty(item.Name).SetValue(obj, value);
                }

            }
        }
    }
}
