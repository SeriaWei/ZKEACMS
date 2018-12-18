/*!
 * http://www.zkea.net/
 * Copyright 2018 ZKEASOFT
 * http://www.zkea.net/licenses
 */

using Easy;
using Easy.Extend;
using Easy.Notification;
using Easy.RepositoryPattern;
using System;
using ZKEACMS.Message.Models;
using ZKEACMS.Setting;

namespace ZKEACMS.Message.Service
{
    public class MessageService : ServiceBase<MessageEntity>, IMessageService
    {
        private readonly INotificationManager _notificationManager;
        private readonly IApplicationSettingService _applicationSettingService;
        public MessageService(IApplicationContext applicationContext, INotificationManager notificationManager, IApplicationSettingService applicationSettingService, CMSDbContext dbContext)
            : base(applicationContext, dbContext)
        {
            _notificationManager = notificationManager;
            _applicationSettingService = applicationSettingService;
        }
        public override ServiceResult<MessageEntity> Add(MessageEntity item)
        {
            ServiceResult<MessageEntity> result = base.Add(item);
            MessageNotificationConfig notifyConfig = _applicationSettingService.Get<MessageNotificationConfig>();
            if (notifyConfig.MessageNotifyEmails.IsNotNullAndWhiteSpace())
            {
                _notificationManager.Send(new RazorEmailNotice
                {
                    Subject = "新的留言提醒",
                    To = notifyConfig.MessageNotifyEmails.Split(new char[] { '\r', '\n', ',', ';' }, StringSplitOptions.RemoveEmptyEntries),
                    Model = item,
                    TemplatePath = "~/wwwroot/Plugins/ZKEACMS.Message/EmailTemplates/MessageNotification.cshtml"
                });
            }
            return result;
        }
    }
}