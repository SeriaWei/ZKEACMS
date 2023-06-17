using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.Widget
{
    public class WidgetViewModel<T> where T : WidgetBase
    {
        public T Widget { get; set; }
    }
}
