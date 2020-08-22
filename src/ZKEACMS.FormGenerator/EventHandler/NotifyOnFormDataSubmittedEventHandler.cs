/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy;
using Easy.Extend;
using Easy.Notification;
using System;
using System.Collections.Generic;
using System.Text;
using ZKEACMS.Event;
using ZKEACMS.FormGenerator.Models;

namespace ZKEACMS.FormGenerator.EventHandler
{
    public class NotifyOnFormDataSubmittedEventHandler : IEventHandler
    {
        private readonly INotificationManager _notificationManager;
        private readonly ILocalize _localize;

        public NotifyOnFormDataSubmittedEventHandler(INotificationManager notificationManager, ILocalize localize)
        {
            _notificationManager = notificationManager;
            _localize = localize;
        }

        public void Handle(object entity, EventArg e)
        {
            FormData formData = entity as FormData;

            if (formData != null && formData.Form.NotificationReceiver.IsNotNullAndWhiteSpace())
            {
                _notificationManager.Send(new RazorEmailNotice
                {
                    Subject = _localize.Get("New form data"),
                    To = formData.Form.NotificationReceiver.Split(new char[] { '\r', '\n', ',', ';' }, StringSplitOptions.RemoveEmptyEntries),
                    Model = formData,
                    TemplatePath = "~/wwwroot/Plugins/ZKEACMS.FormGenerator/EmailTemplates/FormDataNotification.cshtml"
                });
            }

        }
    }
}
