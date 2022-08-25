/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */


using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Easy.Notification
{
    public interface IEmailNotification
    {
        void SendEmail(EmailMessage email);
        Task SendEmailAsync(EmailContext emailContext);
    }
}
