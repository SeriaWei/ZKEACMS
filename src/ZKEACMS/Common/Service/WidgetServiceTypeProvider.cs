using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Widget;

namespace ZKEACMS.Common.Service
{
    public class KnownTypeProvider : IKnownTypeProvider
    {
        public IEnumerable<Type> GetTypes()
        {
            foreach (var item in WidgetBase.KnownWidgetService)
            {
                yield return item.Value;
            }
            foreach (var item in WidgetBase.KnownWidgetModel)
            {
                yield return item.Value;
            }
        }
    }
}
