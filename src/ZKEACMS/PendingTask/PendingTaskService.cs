using Easy;
using Easy.RepositoryPattern;
using Easy.Serializer;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.PendingTask
{
    public class PendingTaskService : ServiceBase<TaskEntity>, IPendingTaskService
    {
        public PendingTaskService(IApplicationContext applicationContext, DbContext dbContext) : base(applicationContext, dbContext)
        {
        }

        public void Add(string handlerName, object context)
        {
            Add(new TaskEntity { HandlerName = handlerName, Data = JsonConverter.Serialize(context) });
        }
    }
}
