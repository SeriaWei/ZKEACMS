/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */


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
        Task Send(EmailContext emailMessage);
        Task<EmailContext> Receive(CancellationToken cancellationToken = default);
    }
}
