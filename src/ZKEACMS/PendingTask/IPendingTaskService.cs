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
        void Add(string handlerName, object context);
        void Update(TaskEntity entity);
        void Remove(TaskEntity entity);
        IEnumerable<TaskEntity> GetPendingTasks();
    }
}
