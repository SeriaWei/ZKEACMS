using Easy.Notification;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace ZKEACMS.Mail.Queue
{
    public class BlockedEmailQueueReader
    {
        private EmailContext _emailContext;
        public BlockedEmailQueueReader(CancellationToken cancellationToken)
        {
            Task = new Task<EmailContext>(GetCurrentContext, cancellationToken, TaskCreationOptions.LongRunning);
        }

        public void ContinueWithResult(EmailContext emailContext)
        {
            _emailContext = emailContext;
            Task.Start();
        }

        public Task<EmailContext> Task { get; private set; }
        EmailContext GetCurrentContext()
        {
            return _emailContext;
        }
    }
}
