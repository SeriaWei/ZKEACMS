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
    public class MessageService : ServiceBase<MessageEntity, CMSDbContext>, IMessageService
    {
        private readonly INotificationManager _notificationManager;
        private readonly IApplicationSettingService _applicationSettingService;
        private readonly ILocalize _localize;
        public MessageService(IApplicationContext applicationContext, 
            INotificationManager notificationManager, 
            IApplicationSettingService applicationSettingService,
            ILocalize localize,
            CMSDbContext dbContext)
            : base(applicationContext, dbContext)
        {
            _notificationManager = notificationManager;
            _applicationSettingService = applicationSettingService;
            _localize = localize;
        }
        public override ServiceResult<MessageEntity> Add(MessageEntity item)
        {
            ServiceResult<MessageEntity> result = base.Add(item);
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
            return result;
        }
    }
}