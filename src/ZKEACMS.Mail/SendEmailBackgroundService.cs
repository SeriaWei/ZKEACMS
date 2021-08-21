using Easy.Notification;
using EasyFrameWork.Notification.Queue;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
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

        public SendEmailBackgroundService(IServiceProvider serviceProvider, IEmailQueue emailQueue)
        {
            _serviceProvider = serviceProvider;
            _emailQueue = emailQueue;
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            while (!stoppingToken.IsCancellationRequested)
            {
                var mailMessage = await _emailQueue.Receive(stoppingToken);

                using (var scopeService = _serviceProvider.CreateScope())
                {
                    var emailNotification = scopeService.ServiceProvider.GetService<IEmailNotification>();
                    if (mailMessage == null) continue;

                    emailNotification.Send(mailMessage);
                }
            }
        }
    }
}
