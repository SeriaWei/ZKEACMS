/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */


using Easy.Notification;
using Easy.Notification.Queue;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace ZKEACMS.Mail
{
    public class SendEmailBackgroundService : BackgroundService
    {
        private readonly IServiceProvider _serviceProvider;
        private readonly IEmailQueue _emailQueue;
        private readonly ILogger<SendEmailBackgroundService> _logger;

        public SendEmailBackgroundService(IServiceProvider serviceProvider, IEmailQueue emailQueue, ILogger<SendEmailBackgroundService> logger)
        {
            _serviceProvider = serviceProvider;
            _emailQueue = emailQueue;
            _logger = logger;
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            while (!stoppingToken.IsCancellationRequested)
            {
                var mailMessage = await _emailQueue.Receive(stoppingToken);
                if (mailMessage == null) continue;

                using (var scopeService = _serviceProvider.CreateScope())
                {
                    var emailNotification = scopeService.ServiceProvider.GetService<IEmailNotification>();

                    mailMessage.RetryCount++;
                    try
                    {
                        emailNotification.Send(mailMessage);
                    }
                    catch (Exception ex)
                    {
                        _logger.LogError(ex, ex.Message);

                        //todo:Retry
                        //if (mailMessage.RetryCount < 5)
                        //    await _emailQueue.Send(mailMessage);
                    }

                }
            }
        }
    }
}
