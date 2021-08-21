using Easy.Notification;
using EasyFrameWork.Notification.Queue;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Channels;
using System.Threading.Tasks;

namespace ZKEACMS.Mail.Queue
{
    public class EmailQueue : IEmailQueue
    {
        private Channel<EmailMessage> _channel;
        public EmailQueue()
        {
            _channel = Channel.CreateUnbounded<EmailMessage>();
        }
        public async Task Push(EmailMessage emailMessage)
        {
            await _channel.Writer.WriteAsync(emailMessage);
        }

        public async Task<EmailMessage> Receive(CancellationToken cancellationToken = default)
        {
            return await _channel.Reader.ReadAsync(cancellationToken);
        }
    }
}
