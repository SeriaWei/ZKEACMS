/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.PendingTask
{
    public interface IPendingTaskService
    {
        void Add(string identifier, string handlerName, object context);
        void Complete(TaskEntity entity);
        void RetryLater(TaskEntity entity);
        void Fail(TaskEntity entity);
        IEnumerable<TaskEntity> GetPendingTasks();
    }
}
