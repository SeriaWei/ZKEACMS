/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using ZKEACMS.EventAction.HttpParser;
using ZKEACMS.PendingTask;

namespace ZKEACMS.EventAction
{
    internal class PendingTaskBackgroundService : BackgroundService
    {
        private readonly IServiceProvider _serviceProvider;

        public PendingTaskBackgroundService(IServiceProvider serviceProvider)
        {
            _serviceProvider = serviceProvider;
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            while (!stoppingToken.IsCancellationRequested)
            {
#if DEBUG
                await Task.Delay(TimeSpan.FromSeconds(5), stoppingToken);
#else
            await Task.Delay(TimeSpan.FromSeconds(60), stoppingToken);
#endif
                using (var scope = _serviceProvider.CreateScope())
                {
                    try
                    {
                        await scope.ServiceProvider.GetService<IPendingTaskManager>().ProcessAllPendingTaskAsync();
                    }
                    catch (Exception ex)
                    {
                        scope.ServiceProvider.GetService<ILogger<PendingTaskBackgroundService>>().LogError(ex, ex.Message);
                    }
                }
            }
        }
    }
}
