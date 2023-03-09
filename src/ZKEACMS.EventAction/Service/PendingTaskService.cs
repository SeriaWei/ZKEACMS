/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Serializer;
using LiteDB;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.PendingTask;
using ZKEACMS.Storage;

namespace ZKEACMS.EventAction.Service
{
    public class PendingTaskService : PluginData<EventActionPlug>, IPendingTaskService
    {
        public PendingTaskService(ILogger<EventActionPlug> logger) : base(logger)
        {
        }

        private ILiteCollection<TaskEntity> GetTaskCollection()
        {
            return GetCollection<TaskEntity>("pendingtasks");
        }

        public void Add(string handlerName, object context)
        {
            GetTaskCollection().Insert(new TaskEntity { HandlerName = handlerName, Data = JsonConverter.Serialize(context) });
        }

        public IEnumerable<TaskEntity> GetPendingTasks()
        {
            return GetTaskCollection().Find(m => m.RetryCount < 5, 0, 100).ToList();
        }

        public void Remove(TaskEntity entity)
        {
            GetTaskCollection().Delete(entity.Id);
        }

        public void Update(TaskEntity entity)
        {
            GetTaskCollection().Update(entity);
        }
    }
}
