/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Mvc.RazorPages;
using EasyFrameWork.Notification.Queue;
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
            base.Send(razorEmailNotice as Message);
        }
    }
}
