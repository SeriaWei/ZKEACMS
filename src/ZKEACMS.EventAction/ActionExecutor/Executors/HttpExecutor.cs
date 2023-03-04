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

namespace ZKEACMS.EventAction.ActionExecutor.Executors
{
    public class HttpExecutor : IActionExecutor
    {
        public const string Name = "actions/http";

        public ServiceResult Execute(object entity, Dictionary<string, string> args)
        {
            //_emailNotification.SendEmail(new EmailMessage { });
            return new ServiceResult();
        }
    }
}
