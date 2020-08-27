/*!
 * http://www.zkea.net/
 * Copyright 2020 ZKEASOFT
 * http://www.zkea.net/licenses
 */

using Easy;
using Easy.Extend;
using Easy.Notification;
using System;
using System.Collections.Generic;
using System.Text;
using ZKEACMS.Event;
using ZKEACMS.Message.Models;
using ZKEACMS.Setting;

namespace ZKEACMS.Message.EventHandler
{
    public class NotifyOnCommentsSubmittedEventHandler : IEventHandler
    {
        private readonly INotificationManager _notificationManager;
        private readonly IApplicationSettingService _applicationSettingService;
        private readonly ILocalize _localize;

        public NotifyOnCommentsSubmittedEventHandler(INotificationManager notificationManager, IApplicationSettingService applicationSettingService, ILocalize localize)
        {
            _notificationManager = notificationManager;
            _applicationSettingService = applicationSettingService;
            _localize = localize;
        }

        public void Handle(object entity, EventArg e)
        {
            Comments item = entity as Comments;
            if (item != null)
            {
                MessageNotificationConfig notifyConfig = _applicationSettingService.Get<MessageNotificationConfig>();
                if (notifyConfig.CommentNotifyEmails.IsNotNullAndWhiteSpace())
                {
                    _notificationManager.Send(new RazorEmailNotice
                    {
                        Subject = _localize.Get("New comment"),
                        To = notifyConfig.CommentNotifyEmails.Split(new char[] { '\r', '\n', ',', ';' }, StringSplitOptions.RemoveEmptyEntries),
                        Model = item,
                        TemplatePath = "~/wwwroot/Plugins/ZKEACMS.Message/EmailTemplates/CommentNotification.cshtml"
                    });
                }
            }

        }
    }
}
