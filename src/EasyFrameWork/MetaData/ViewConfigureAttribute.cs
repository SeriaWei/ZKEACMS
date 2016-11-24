/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Cache;
using Easy.ViewPort.Descriptor;
using Easy.Extend;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;

namespace Easy.MetaData
{
    [AttributeUsage(AttributeTargets.Class)]
    public class ViewConfigureAttribute : Attribute
    {
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
            StaticCache cache = new StaticCache();
            string typeName = targetType.FullName;
            var attribute = cache.Get("DataConfigureAttribute_" + typeName, m => targetType.GetTypeInfo().GetCustomAttribute(typeof(ViewConfigureAttribute)) as ViewConfigureAttribute);
            return attribute;
        }
        public static ViewConfigureAttribute GetAttribute(Type type)
        {
            if (type == null) return null;
            StaticCache cache = new StaticCache();
            string typeName = type.FullName;
            var attribute = cache.Get("DataConfigureAttribute_" + typeName, m => type.GetTypeInfo().GetCustomAttribute(typeof(ViewConfigureAttribute)) as ViewConfigureAttribute);
            return attribute;

        }
    }
}
