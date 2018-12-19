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
    public class CommentsService : ServiceBase<Comments>, ICommentsService
    {
        private readonly INotificationManager _notificationManager;
        private readonly IApplicationSettingService _applicationSettingService;
        public CommentsService(IApplicationContext applicationContext, INotificationManager notificationManager, IApplicationSettingService applicationSettingService, CMSDbContext dbContext) 
            : base(applicationContext, dbContext)
        {
            _notificationManager = notificationManager;
            _applicationSettingService = applicationSettingService;
        }
        public override ServiceResult<Comments> Add(Comments item)
        {
            ServiceResult<Comments> result = base.Add(item);
            MessageNotificationConfig notifyConfig = _applicationSettingService.Get<MessageNotificationConfig>();
            if (notifyConfig.CommentNotifyEmails.IsNotNullAndWhiteSpace())
            {
                _notificationManager.Send(new RazorEmailNotice
                {
                    Subject = "新的评论提醒",
                    To = notifyConfig.CommentNotifyEmails.Split(new char[] { '\r', '\n', ',', ';' }, StringSplitOptions.RemoveEmptyEntries),
                    Model = item,
                    TemplatePath = "~/wwwroot/Plugins/ZKEACMS.Message/EmailTemplates/CommentNotification.cshtml"
                });
            }
            return result;
        }
    }
}
