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
    public class EmailContext
    {
        public EmailContext(EmailMessage emailMessage)
        {
            EmailMessage = emailMessage;
            RetryCount = 0;
        }
        public EmailMessage EmailMessage { get; set; }
        public int RetryCount { get; set; }
    }
}
