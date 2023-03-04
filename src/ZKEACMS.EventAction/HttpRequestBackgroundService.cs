/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using ZKEACMS.EventAction.HttpParser;

namespace ZKEACMS.EventAction
{
    internal class HttpRequestBackgroundService : BackgroundService
    {
        private readonly IHttpRequestQueue _httpRequestQueue;
        private readonly IServiceProvider _serviceProvider;

        public HttpRequestBackgroundService(IHttpRequestQueue httpRequestQueue, IServiceProvider serviceProvider)
        {
            _httpRequestQueue = httpRequestQueue;
            _serviceProvider = serviceProvider;
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            while (!stoppingToken.IsCancellationRequested)
            {
                var httpRequest = await _httpRequestQueue.Receive(stoppingToken);
                if (httpRequest == null) continue;

                using(var scope= _serviceProvider.CreateScope())
                {
                    await scope.ServiceProvider.GetService<IHttpRequesetSender>().SendAsync(httpRequest);
                }
            }
        }
    }
}
