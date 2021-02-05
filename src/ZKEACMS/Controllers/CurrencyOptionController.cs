/* http://www.zkea.net/ 
 * Copyright 2021 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy.Mvc.Authorize;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Currency;
using ZKEACMS.Setting;

namespace ZKEACMS.Controllers
{
    [PopulateCurrency, DefaultAuthorize(Policy = PermissionKeys.ConfigCurrency)]
    public class CurrencyOptionController : SettingController<CurrencyOption>
    {
        public CurrencyOptionController(IApplicationSettingService applicationSettingService) : base(applicationSettingService)
        {
        }
    }
}
