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
    public sealed class PendingTaskExecutor : IPendingTaskExecutor
    {
        private static Dictionary<string, Type> _taskHandlers = new Dictionary<string, Type>();
        private readonly IServiceProvider _serviceProvider;
        private readonly IPendingTaskService _pendingTaskService;
        private readonly ILogger<PendingTaskExecutor> _logger;

        public PendingTaskExecutor(IServiceProvider serviceProvider,
            IPendingTaskService pendingTaskService,
            ILogger<PendingTaskExecutor> logger)
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
                task.RetryCount += 1;
                if (!_taskHandlers.TryGetValue(task.HandlerName, out var handlerType))
                {
                    task.LogMessage = "Pending task handler is not found.";
                    _pendingTaskService.Fail(task);
                    continue;
                }
                var taskHandler = _serviceProvider.GetService(handlerType) as IPendingTaskHandler<object>;
                try
                {
                    var context = taskHandler.Deserialize(task.Data);
                    await taskHandler.ExecuteAsync(context);
                    _pendingTaskService.Complete(task);
                }
                catch (Exception ex)
                {
                    _logger.LogError(ex, ex.Message);
                    task.LogMessage = ex.ToString();
                    if (task.RetryCount < 5)
                    {
                        _pendingTaskService.RetryLater(task);
                    }
                    else
                    {
                        _pendingTaskService.Fail(task);
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
