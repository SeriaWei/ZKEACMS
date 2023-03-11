/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Microsoft.AspNetCore.Hosting;
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
        bool _production;

        public PendingTaskBackgroundService(IServiceProvider serviceProvider, IWebHostEnvironment webHostEnvironment)
        {
            _serviceProvider = serviceProvider;
            _production = webHostEnvironment.IsProduction();
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            while (!stoppingToken.IsCancellationRequested)
            {
                await Task.Delay(TimeSpan.FromSeconds(_production ? 60 : 5), stoppingToken);

                using (var scope = _serviceProvider.CreateScope())
                {
                    try
                    {
                        await scope.ServiceProvider.GetService<IPendingTaskExecutor>().ProcessAllPendingTaskAsync();
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
