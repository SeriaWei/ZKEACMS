/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Mvc.RazorPages;
using Easy.Notification.Queue;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.Notification
{
    public class RazorEmailNotificationProvider : EmailNotificationProvider
    {
        private readonly IViewRenderService _viewRenderService;
        public RazorEmailNotificationProvider(IViewRenderService viewRenderService, ISmtpProvider smtpProvider, ILogger<EmailNotificationProvider> logger, IEmailQueue emailQueue)
            : base(smtpProvider, logger, emailQueue)
        {
            _viewRenderService = viewRenderService;
        }
        public override Type SupportType => typeof(RazorEmailMessage);
        public override void Send(Message notice)
        {
            RazorEmailMessage razorEmailNotice = notice as RazorEmailMessage;
            razorEmailNotice.IsHtml = true;
            razorEmailNotice.Content = _viewRenderService.Render(razorEmailNotice.TemplatePath, razorEmailNotice.Model);
            EmailMessage emailMessage = new EmailMessage
            {
                Subject = razorEmailNotice.Subject,
                From = razorEmailNotice.From,
                To = razorEmailNotice.To,
                Cc = razorEmailNotice.Cc,
                Bcc = razorEmailNotice.Bcc,
                Content = razorEmailNotice.Content,
                Attachments = razorEmailNotice.Attachments,
                DisplayName = razorEmailNotice.DisplayName,
                IsHtml = razorEmailNotice.IsHtml
            };
            base.Send(emailMessage as Message);
        }
    }
}
