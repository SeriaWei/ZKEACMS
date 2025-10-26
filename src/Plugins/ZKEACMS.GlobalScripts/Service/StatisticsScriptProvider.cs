/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.GlobalScripts.Models;
using ZKEACMS.Setting;

namespace ZKEACMS.GlobalScripts.Service
{
    public class StatisticsScriptProvider : GlobalScriptsProviderService<StatisticsScript>
    {
        public StatisticsScriptProvider(IApplicationContextAccessor applicationContextAccessor, IApplicationSettingService applicationSettingService) 
            : base(applicationContextAccessor, applicationSettingService)
        {
        }
    }
}
