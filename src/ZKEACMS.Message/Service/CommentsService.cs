/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

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
        public override ErrorOr<Comments> Add(Comments item)
        {
            ErrorOr<Comments> result = base.Add(item);
            if (!result.HasError)
            {
                _eventManager.Trigger(Events.OnCommentsSubmitted, item);
            }
            return result;
        }
    }
}
