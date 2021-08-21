using Easy.Notification;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace EasyFrameWork.Notification.Queue
{
    public interface IEmailQueue
    {
        Task Push(EmailMessage emailMessage);
        Task<EmailMessage> Receive(CancellationToken cancellationToken = default);
    }
}
