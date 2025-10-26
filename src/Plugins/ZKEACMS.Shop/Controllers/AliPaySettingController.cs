/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Alipay.AopSdk.AspnetCore;
using Easy.Mvc.Authorize;
using Microsoft.AspNetCore.Mvc;
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
