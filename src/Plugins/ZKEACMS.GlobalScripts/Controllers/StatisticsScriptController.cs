/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Easy.Mvc.Controllers;
using ZKEACMS.GlobalScripts.Service;
using Easy.Mvc.Authorize;
using ZKEACMS.GlobalScripts.Models;
using ZKEACMS.Setting;
using ZKEACMS.Controllers;

namespace ZKEACMS.GlobalScripts.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.ManageStatisticsScript)]
    public class StatisticsScriptController : SettingController<StatisticsScript>
    {
        public StatisticsScriptController(IApplicationSettingService applicationSettingService) : base(applicationSettingService)
        {
        }
    }
}
