using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ZKEACMS.PackageManger;

namespace ZKEACMS.Widget
{
    public class WidgetPackage : FilePackage
    {
        public WidgetPackage(string installer) : base(installer)
        {

        }
        public WidgetBase Widget { get; set; }
    }
}
