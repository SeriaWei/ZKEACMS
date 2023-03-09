/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Constant;
using Easy.RepositoryPattern;
using Microsoft.Extensions.Logging;
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
        private readonly ILogger<PendingTaskManager> _logger;

        public PendingTaskManager(IServiceProvider serviceProvider, 
            IPendingTaskService pendingTaskService, 
            ILogger<PendingTaskManager> logger)
        {
            _serviceProvider = serviceProvider;
            _pendingTaskService = pendingTaskService;
            _logger = logger;
        }

        public async Task ProcessAllPendingTaskAsync()
        {
            var tasks = _pendingTaskService.GetPendingTasks();
            foreach (var task in tasks)
            {
                if (!_taskHandlers.TryGetValue(task.HandlerName, out var handlerType))
                {
                    task.Error = "Pending task handler is not found.";
                    _pendingTaskService.Remove(task);
                    continue;
                }
                var taskHandler = _serviceProvider.GetService(handlerType) as IPendingTaskHandler<object>;
                try
                {
                    var context = taskHandler.Deserialize(task.Data);
                    await taskHandler.ExecuteAsync(context);
                    _pendingTaskService.Remove(task);
                }
                catch (Exception ex)
                {
                    _logger.LogError(ex, ex.Message);
                    task.Error = ex.ToString();
                    task.RetryCount += 1;
                    if (task.RetryCount < 5)
                    {
                        _pendingTaskService.Update(task);
                    }
                    else
                    {
                        _pendingTaskService.Remove(task);
                    }
                }
            }
        }

        public static void RegistTaskHandler(string name, Type type)
        {
            _taskHandlers[name] = type;
        }
    }
}
