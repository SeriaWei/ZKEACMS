/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using Easy.Mvc.Authorize;
using System;
using System.Collections.Generic;
using System.Text;
using ZKEACMS.Common.Models;
using ZKEACMS.Setting;

namespace ZKEACMS.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.RobotsSetting)]
    public class RobotsSettingController : SettingController<Robots>
    {
        public RobotsSettingController(IApplicationSettingService applicationSettingService) : base(applicationSettingService)
        {
        }
    }
}
