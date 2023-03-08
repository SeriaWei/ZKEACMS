/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Notification;
using Easy.Notification.Queue;
using LiteDB;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading;
using System.Threading.Tasks;
using ZKEACMS.Storage;

namespace ZKEACMS.Mail.Queue
{
    public class PersistentEmailQueue : PluginData<MailPlug>, IEmailQueue
    {
        public PersistentEmailQueue(ILogger<MailPlug> logger) : base(logger)
        {
        }

        private ILiteCollection<T> GetMailCollection<T>() where T : EmailContext
        {
            return GetCollection<T>("Emails");
        }
        public async Task<EmailContext> Receive(CancellationToken cancellationToken = default)
        {
            var result = ReceiveFromFile();
            if (result != null) return result;

#if DEBUG
            await Task.Delay(TimeSpan.FromSeconds(5), cancellationToken);
#else
            await Task.Delay(TimeSpan.FromSeconds(60), cancellationToken);
#endif
            return null;
        }

        public EmailContext ReceiveFromFile()
        {
            var collection = GetMailCollection<EmailContextQueueItem>();
            if (collection.Count() == 0) return null;

            var result = collection.Find(m => m.RetryCount < 10, 0, 1).FirstOrDefault();
            if (result == null) return null;

            collection.Delete(result.Id);
            return result;
        }

        public Task Send(EmailContext emailMessage)
        {
            GetMailCollection<EmailContext>().Insert(emailMessage);
            return Task.CompletedTask;
        }
    }
}
