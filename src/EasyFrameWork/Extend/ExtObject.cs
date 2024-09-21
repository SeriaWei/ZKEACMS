/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Serializer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Easy.Extend
{
    public static class ExtObject
    {
        public static T Clone<T>(this T obj) where T : class
        {
            return JsonConverter.Deserialize<T>(JsonConverter.Serialize(obj));
        }
    }
}
