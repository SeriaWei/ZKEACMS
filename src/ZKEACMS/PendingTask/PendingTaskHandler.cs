/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Serializer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.PendingTask
{
    public abstract class PendingTaskHandler<T> : IPendingTaskHandler<T>
    {
        public T Deserialize(string rowData)
        {
            return JsonConverter.Deserialize<T>(rowData);
        }

        public abstract Task ExecuteAsync(object context);
    }
}
