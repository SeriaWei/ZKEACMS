using Easy.Notification;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.Mail.Queue
{
    public class BlockedEmailQueueReader
    {
        private readonly PersistentEmailQueue _emailQueue;
        private EmailContext emailContext;
        public BlockedEmailQueueReader(PersistentEmailQueue emailQueue)
        {
            _emailQueue = emailQueue;
            Task = new Task<EmailContext>(GetCurrentContext);
        }

        public async Task<bool> TryDequeueAsync()
        {
            emailContext = await _emailQueue.ReceiveFromFileAsync();
            if (emailContext == null) return false;
            
            Task.Start();
            return true;
        }

        public Task<EmailContext> Task { get; private set; }
        EmailContext GetCurrentContext()
        {
            return emailContext;
        }
    }
}
