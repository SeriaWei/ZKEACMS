using Easy.Notification;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.Mail.Queue
{
    public class BlockedEmailQueueReader : TaskCompletionSource<EmailContext>
    {
        private readonly PersistentEmailQueue _emailQueue;
        public BlockedEmailQueueReader(PersistentEmailQueue emailQueue)
        {
            _emailQueue = emailQueue;
        }
        public async Task<bool> TryDequeueAsync()
        {
            var emailContext = await _emailQueue.ReceiveFromFileAsync();
            if (emailContext == null) return false;
            await System.Threading.Tasks.Task.Factory.StartNew(state =>
            {
                SetResult(state as EmailContext);
            }, emailContext);
            return true;
        }
    }
}
