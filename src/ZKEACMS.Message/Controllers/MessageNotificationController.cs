/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using ZKEACMS.Controllers;
using ZKEACMS.Message.Models;
using ZKEACMS.Setting;

namespace ZKEACMS.Message.Controllers
{
    [Easy.Mvc.Authorize.DefaultAuthorize(Policy = PermissionKeys.ManageMessageNotification)]
    public class MessageNotificationController : SettingController<MessageNotificationConfig>
    {
        public MessageNotificationController(IApplicationSettingService applicationSettingService) : base(applicationSettingService)
        {
        }
    }
}
