using Easy.Constant;
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.PendingTask
{
    public class PendingTaskManager : IPendingTaskManager
    {
        private static Dictionary<string, Type> _taskHandlers = new Dictionary<string, Type>();
        private readonly IServiceProvider _serviceProvider;
        private readonly IPendingTaskService _pendingTaskService;

        public PendingTaskManager(IServiceProvider serviceProvider, IPendingTaskService pendingTaskService)
        {
            _serviceProvider = serviceProvider;
            _pendingTaskService = pendingTaskService;
        }

        public void ProcessAllPendingTasks()
        {
            var tasks = _pendingTaskService.Get(m => m.Status == (int)RecordStatus.Active, new Pagination());
            foreach (var task in tasks)
            {
                if (!_taskHandlers.TryGetValue(task.HandlerName, out var handler))
                {
                    task.Status=(int)RecordStatus.InActive;
                    task.Log = "Pending task handler is not found.";
                    _pendingTaskService.Update(task);
                    continue;
                }
                _serviceProvider.GetService(handler);
            }
        }
    }
}
