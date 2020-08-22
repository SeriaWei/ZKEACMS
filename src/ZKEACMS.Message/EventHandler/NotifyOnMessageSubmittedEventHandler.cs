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
    public class NotifyOnMessageSubmittedEventHandler : IEventHandler
    {
        private readonly INotificationManager _notificationManager;
        private readonly IApplicationSettingService _applicationSettingService;
        private readonly ILocalize _localize;

        public NotifyOnMessageSubmittedEventHandler(INotificationManager notificationManager, IApplicationSettingService applicationSettingService, ILocalize localize)
        {
            _notificationManager = notificationManager;
            _applicationSettingService = applicationSettingService;
            _localize = localize;
        }

        public void Handle(object entity, EventArg e)
        {
            MessageEntity item = entity as MessageEntity;
            if (item != null)
            {
                MessageNotificationConfig notifyConfig = _applicationSettingService.Get<MessageNotificationConfig>();
                if (notifyConfig.MessageNotifyEmails.IsNotNullAndWhiteSpace())
                {
                    _notificationManager.Send(new RazorEmailNotice
                    {
                        Subject = _localize.Get("New message"),
                        To = notifyConfig.MessageNotifyEmails.Split(new char[] { '\r', '\n', ',', ';' }, StringSplitOptions.RemoveEmptyEntries),
                        Model = item,
                        TemplatePath = "~/wwwroot/Plugins/ZKEACMS.Message/EmailTemplates/MessageNotification.cshtml"
                    });
                }
            }
        }
    }
}
