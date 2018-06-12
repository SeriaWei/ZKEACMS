using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;
using ZKEACMS.Setting;

namespace ZKEACMS.Controllers
{
    public class SmtpSettingController : SettingController<SmtpSetting>
    {
        public SmtpSettingController(IApplicationSettingService applicationSettingService) : base(applicationSettingService)
        {

        }
    }
}
