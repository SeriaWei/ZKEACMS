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
        private System.Timers.Timer _blockedQueueReaderTrigger;

        public PersistentEmailQueue(ILogger<MailPlug> logger) : base(logger)
        {
            _blockedQueueReaderTrigger = new System.Timers.Timer(2000);
            _blockedQueueReaderTrigger.Elapsed += Elapsed;
        }

        private void Elapsed(object sender, System.Timers.ElapsedEventArgs e)
        {
            Dequeue();
        }

        private ILiteCollection<T> GetMailCollection<T>() where T : EmailContext
        {
            return GetCollection<T>("Emails");
        }
        public Task<EmailContext> Receive(CancellationToken cancellationToken = default)
        {
            var result = ReceiveFromFile();
            if (result != null) return Task.FromResult(result);

            BlockedEmailQueueReader queueReader = new BlockedEmailQueueReader(cancellationToken);
            _queueReaders.Push(queueReader);
            return queueReader.Task;
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
            if (!_blockedQueueReaderTrigger.Enabled)
            {
                _blockedQueueReaderTrigger.Start();
            }
            return Task.CompletedTask;
        }
        private void Dequeue()
        {
            lock (_queueReaders)
            {
                while (_queueReaders.Count > 0)
                {
                    var result = ReceiveFromFile();
                    if (result == null)
                    {
                        _blockedQueueReaderTrigger.Stop();
                        return;
                    }

                    BlockedEmailQueueReader queueReader;
                    if (_queueReaders.TryPop(out queueReader))
                    {
                        queueReader.ContinueWithResult(result);
                    }
                }
            }
        }
    }
}
