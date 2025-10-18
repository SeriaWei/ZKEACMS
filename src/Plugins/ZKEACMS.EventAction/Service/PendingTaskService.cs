﻿/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Constant;
using Easy.Serializer;
using LiteDB;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.EventAction.Models;
using ZKEACMS.PendingTask;
using ZKEACMS.Storage;

namespace ZKEACMS.EventAction.Service
{
    public sealed class PendingTaskService : IPendingTaskService
    {
        private readonly IDBContextProvider _dbContextProvider;
        private readonly Dictionary<TaskEntity, DbContext> _dbContextMapping;
        private const int MaxTryTimes = 5;
        public PendingTaskService(IDBContextProvider dbContextProvider)
        {
            _dbContextProvider = dbContextProvider;
            _dbContextMapping = new Dictionary<TaskEntity, DbContext>();
        }

        public void Add(string identifier, string handlerName, object context)
        {
            if (identifier is null)
            {
                throw new ArgumentNullException(nameof(identifier));
            }

            if (handlerName is null)
            {
                throw new ArgumentNullException(nameof(handlerName));
            }

            var newTask = new PendingTaskEntity
            {
                Identifier = identifier,
                HandlerName = handlerName,
                Data = JsonConverter.Serialize(context),
                Status = (int)PendingTaskStatus.Pending,
                CreateDate = DateTime.Now,
                LastUpdateDate = DateTime.Now
            };
            if (newTask.Identifier.Length > 200)
            {
                newTask.Identifier = newTask.Identifier.Substring(0, 200);
            }
            _dbContextProvider.Current.Set<PendingTaskEntity>().Add(newTask);
            _dbContextProvider.Current.SaveChanges();
        }

        public IEnumerable<TaskEntity> GetPendingTasks()
        {
            foreach (var dbContext in _dbContextProvider.GetAvailableDbContexts())
            {
                foreach (var item in GetTopTasks(dbContext))
                {
                    _dbContextMapping[item] = dbContext;
                    yield return item;
                }
            }
        }

        private IEnumerable<PendingTaskEntity> GetTopTasks(DbContext dbContext)
        {
            return dbContext.Set<PendingTaskEntity>()
                .Where(m => m.Status == (int)PendingTaskStatus.Pending && m.RetryCount < MaxTryTimes)
                .OrderBy(m => m.LastUpdateDate)
                .Take(100)
                .ToArray();
        }

        public void Fail(TaskEntity entity)
        {
            (entity as PendingTaskEntity).LastUpdateDate = DateTime.Now;
            entity.Status = (int)PendingTaskStatus.Failed;
            var dbContext = _dbContextMapping[entity];
            dbContext.Set<PendingTaskEntity>().Update(entity as PendingTaskEntity);
            dbContext.SaveChanges();
        }

        public void Complete(TaskEntity entity)
        {
            (entity as PendingTaskEntity).LastUpdateDate = DateTime.Now;
            entity.Status = (int)PendingTaskStatus.Complete;
            var dbContext = _dbContextMapping[entity];
            dbContext.Set<PendingTaskEntity>().Update(entity as PendingTaskEntity);
            dbContext.SaveChanges();
        }

        public void RetryLater(TaskEntity entity)
        {
            (entity as PendingTaskEntity).LastUpdateDate = DateTime.Now;
            if (entity.RetryCount >= MaxTryTimes)
            {
                entity.RetryCount = 0;
            }
            var dbContext = _dbContextMapping[entity];
            dbContext.Set<PendingTaskEntity>().Update(entity as PendingTaskEntity);
            dbContext.SaveChanges();
        }
    }
}
