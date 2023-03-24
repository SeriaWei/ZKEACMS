/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;

namespace Easy.Reflection
{
    public class ValueConverter
    {
        public static object Convert(object obj, Type targetType)
        {
            if (obj == null) return null;
            
            var realType = Nullable.GetUnderlyingType(targetType) ?? targetType;
            return System.Convert.ChangeType(obj, realType);
        }
    }
}
