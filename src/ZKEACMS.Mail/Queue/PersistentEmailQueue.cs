/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Notification;
using Easy.Notification.Queue;
using System;
using System.Threading;
using System.Threading.Tasks;
using ZKEACMS.PendingTask;

namespace ZKEACMS.Mail.Queue
{
    public class PersistentEmailQueue : IEmailQueue
    {
        private readonly IPendingTaskService _pendingTaskService;

        public PersistentEmailQueue(IPendingTaskService pendingTaskService)
        {
            _pendingTaskService = pendingTaskService;
        }

        public Task<EmailContext> Receive(CancellationToken cancellationToken = default)
        {
            throw new NotImplementedException();
        }

        public Task Send(EmailContext emailMessage)
        {
            _pendingTaskService.Add(EmailPendingTaskHandler.Name, emailMessage);
            return Task.CompletedTask;
        }
    }
}
