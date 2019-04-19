using Alipay.AopSdk.AspnetCore;
using Easy.Mvc.Authorize;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;
using ZKEACMS.Controllers;
using ZKEACMS.Setting;
using ZKEACMS.Shop;

namespace ZKEACMS.Shop.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.PaymentConfigManage)]
    public class AliPaySettingController : SettingController<AlipayOptions>
    {
        public AliPaySettingController(IApplicationSettingService applicationSettingService) : base(applicationSettingService)
        {

        }
    }
}
