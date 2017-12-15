/* http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses 
 */

using Easy.Extend;
using Easy.ViewPort.Descriptor;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Easy.MetaData
{
    public class ViewConfigure
    {
        public IViewMetaData MetaData
        {
            get;
            private set;
        }
        public ViewConfigure(IViewMetaData metaData)
        {
            MetaData = metaData;
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
    }
}
