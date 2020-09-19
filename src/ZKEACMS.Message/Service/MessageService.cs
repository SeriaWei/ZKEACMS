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
using ZKEACMS.Event;
using ZKEACMS.Message.Models;
using ZKEACMS.Setting;

namespace ZKEACMS.Message.Service
{
    public class MessageService : ServiceBase<MessageEntity, CMSDbContext>, IMessageService
    {
        private readonly IEventManager _eventManager;
        public MessageService(IApplicationContext applicationContext, CMSDbContext dbContext, IEventManager eventManager)
            : base(applicationContext, dbContext)
        {
            _eventManager = eventManager;
        }
        public override ServiceResult<MessageEntity> Add(MessageEntity item)
        {
            ServiceResult<MessageEntity> result = base.Add(item);
            if (!result.HasViolation)
            {
                _eventManager.Trigger(Events.OnMessageSubmitted, item);
            }
            return result;
        }
    }
}