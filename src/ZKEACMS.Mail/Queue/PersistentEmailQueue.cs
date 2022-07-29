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
        private Stack<BlockedEmailQueueReader> _queueReaders = new Stack<BlockedEmailQueueReader>();

        public PersistentEmailQueue(ILogger<MailPlug> logger) : base(logger)
        {
        }

        private ILiteCollection<T> GetMailCollection<T>() where T : EmailContext
        {
            return GetCollection<T>("Emails");
        }
        public async Task<EmailContext> Receive(CancellationToken cancellationToken = default)
        {
            var result = await ReceiveFromFileAsync();
            if (result != null) return result;

            BlockedEmailQueueReader queueReader = new BlockedEmailQueueReader(this, cancellationToken);
            _queueReaders.Push(queueReader);
            return await queueReader.Task;
        }

        public async Task<EmailContext> ReceiveFromFileAsync()
        {
            var collection = GetMailCollection<EmailContextQueueItem>();
            if (collection.Count() == 0) return null;

            var result = collection.Find(m => m.RetryCount < 10, 0, 1).FirstOrDefault();
            if (result == null) return null;

            collection.Delete(result.Id);
            return await Task.FromResult(result);
        }

        public async Task Send(EmailContext emailMessage)
        {
            GetMailCollection<EmailContext>().Insert(emailMessage);
            BlockedEmailQueueReader reader;
            lock (_queueReaders)
            {
                _queueReaders.TryPop(out reader);
            }
            if (reader != null)
            {
                bool success = await reader.TryDequeueAsync();
                if (!success)
                {
                    _queueReaders.Push(reader);
                }
            }
        }
    }
}
