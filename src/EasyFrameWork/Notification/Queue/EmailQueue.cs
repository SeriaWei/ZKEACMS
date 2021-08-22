/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
 

using Easy.Notification;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Channels;
using System.Threading.Tasks;

namespace Easy.Notification.Queue
{
    public class EmailQueue : IEmailQueue
    {
        private Channel<EmailContext> _channel;
        public EmailQueue()
        {
            _channel = Channel.CreateUnbounded<EmailContext>();
        }
        public async Task Send(EmailContext emailContext)
        {
            await _channel.Writer.WriteAsync(emailContext);
        }

        public async Task<EmailContext> Receive(CancellationToken cancellationToken = default)
        {
            return await _channel.Reader.ReadAsync(cancellationToken);
        }
    }
}
