/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
 
using Easy.Notification;
using Easy.Notification.Queue;
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Event;

namespace ZKEACMS.EventAction.ActionExecutor.Executors
{
    public class EmailExecutor : IActionExecutor
    {
        public const string Name = "actions/email";
        private readonly IEmailNotification _emailNotification;

        public EmailExecutor(IEmailNotification emailNotification)
        {
            _emailNotification = emailNotification;
        }

        public ServiceResult Execute(Dictionary<string, string> args, object model, EventArg e)
        {
            //_emailNotification.SendEmail(new EmailMessage { });
            return new ServiceResult();
        }
    }
}
