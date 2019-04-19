/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */
using Easy.Mvc.RazorPages;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.Notification
{
    public class RazorEmailNotifyService : EmailNotifyService
    {
        private readonly IViewRenderService _viewRenderService;
        public RazorEmailNotifyService(IViewRenderService viewRenderService, ISmtpProvider smtpProvider, ILogger<EmailNotifyService> logger)
            : base(smtpProvider, logger)
        {
            _viewRenderService = viewRenderService;
        }
        public override Type SupportType => typeof(RazorEmailNotice);
        public override void Send(Notice notice)
        {
            RazorEmailNotice razorEmailNotice = notice as RazorEmailNotice;
            razorEmailNotice.IsHtml = true;
            razorEmailNotice.Content = _viewRenderService.Render(razorEmailNotice.TemplatePath, razorEmailNotice.Model);
            base.Send(razorEmailNotice);
        }
    }
}
