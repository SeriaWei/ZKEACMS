/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System.Collections.Generic;
using ZKEACMS.Dashboard;

namespace ZKEACMS.Common.ViewModels
{
    public class DashboardViewModel
    {
        public IEnumerable<DashboardPart> Parts { get; set; }
    }
}