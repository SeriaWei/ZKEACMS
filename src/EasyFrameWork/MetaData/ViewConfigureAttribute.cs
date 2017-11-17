/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */

using Easy.ViewPort.Descriptor;
using Easy.Extend;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using CacheManager.Core;

namespace Easy.MetaData
{
    [AttributeUsage(AttributeTargets.Class)]
    public class ViewConfigureAttribute : Attribute
    {
        static ICacheManager<ViewConfigureAttribute> AttributeCache;
        static ViewConfigureAttribute()
        {
            AttributeCache = CacheFactory.Build<ViewConfigureAttribute>(setting => { setting.WithDictionaryHandle("ViewConfigureAttribute"); });
        }
        public IViewMetaData MetaData
        {
            get;
            private set;
        }
        public ViewConfigureAttribute(Type metaDataType)
        {
            MetaData = Activator.CreateInstance(metaDataType) as IViewMetaData;
        }


        public List<BaseDescriptor> GetViewPortDescriptors(bool widthHidden)
        {
            List<BaseDescriptor> returnValue = (from item in MetaData.ViewPortDescriptors where !item.Value.IsIgnore where (item.Value.TagType != ViewPort.HTMLEnumerate.HTMLTagTypes.Hidden && !item.Value.IsHidden) || widthHidden select item.Value).ToList();
            return returnValue.OrderBy(q => q.OrderIndex).ToList();
        }

        public BaseDescriptor GetViewPortDescriptor(string property)
        {
            if (MetaData.ViewPortDescriptors.ContainsKey(property))
            {
                return MetaData.ViewPortDescriptors[property];
            }
            return null;
        }
        public BaseDescriptor GetHtmlTag<T>(System.Linq.Expressions.Expression<Func<T, object>> expression)
        {
            string property = Reflection.LinqExpression.GetPropertyName(expression.Body);
            return GetViewPortDescriptor(property);
        }

        public void InitDisplayName()
        {
            MetaData.ViewPortDescriptors.Each(m =>
            {
                if (m.Value.DisplayName.IsNullOrWhiteSpace())
                {
                    m.Value.DisplayName = Localization.Get(m.Value.ModelType.Name + "@" + m.Value.Name);
                }
            });
        }

        public static ViewConfigureAttribute GetAttribute<T>()
        {
            Type targetType = typeof(T);
            ViewConfigureAttribute result;
            if (AttributeCache.TryGetOrAdd(targetType.FullName, key => targetType.GetTypeInfo().GetCustomAttribute(typeof(ViewConfigureAttribute)) as ViewConfigureAttribute, out result))
            {
                return result;
            }
            return null;
        }
        public static ViewConfigureAttribute GetAttribute(Type type)
        {
            if (type == null) return null;
            ViewConfigureAttribute result;
            if (AttributeCache.TryGetOrAdd(type.FullName, key => type.GetTypeInfo().GetCustomAttribute(typeof(ViewConfigureAttribute)) as ViewConfigureAttribute, out result))
            {
                return result;
            }
            return null;
        }
        public static void ClearCache()
        {
            AttributeCache.Clear();
        }
    }
}
