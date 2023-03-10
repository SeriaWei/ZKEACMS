using Easy.Notification;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.PendingTask;

namespace ZKEACMS.Mail
{
    public class EmailPendingTaskHandler : PendingTaskHandler<EmailContext>
    {
        public const string Name = "EmailPendingTaskHandler";
        private readonly IEmailNotification _emailNotification;

        public EmailPendingTaskHandler(IEmailNotification emailNotification)
        {
            _emailNotification = emailNotification;
        }

        public override Task ExecuteAsync(object context)
        {
            return _emailNotification.SendEmailAsync(context as EmailContext);
        }
    }
}
