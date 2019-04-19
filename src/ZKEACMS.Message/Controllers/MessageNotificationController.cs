/*!
 * http://www.zkea.net/
 * Copyright 2018 ZKEASOFT
 * http://www.zkea.net/licenses
 */

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
