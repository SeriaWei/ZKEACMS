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
    public class CommentsService : ServiceBase<Comments, CMSDbContext>, ICommentsService
    {
        private readonly IEventManager _eventManager;
        public CommentsService(IApplicationContext applicationContext, CMSDbContext dbContext, IEventManager eventManager = null)
            : base(applicationContext, dbContext)
        {
            _eventManager = eventManager;
        }
        public override ServiceResult<Comments> Add(Comments item)
        {
            ServiceResult<Comments> result = base.Add(item);
            if (!result.HasViolation)
            {
                _eventManager.Trigger(Events.OnCommentsSubmitted, item);
            }
            return result;
        }
    }
}
