/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using Easy.Mvc.Authorize;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;
using ZKEACMS.Setting;
using ZKEACMS.SMTP;

namespace ZKEACMS.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.SMTPSetting)]
    public class SmtpSettingController : SettingController<SmtpSetting>
    {
        public SmtpSettingController(IApplicationSettingService applicationSettingService) : base(applicationSettingService)
        {

        }
    }
}
