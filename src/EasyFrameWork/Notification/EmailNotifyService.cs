/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.Text;
using System.Net.Mail;
using System.Net;
using Easy.Extend;
using Microsoft.Extensions.Logging;
using System.IO;

namespace Easy.Notification
{
    public class EmailNotifyService : INotifyService
    {
        private readonly ISmtpProvider _smtpProvider;
        private readonly ILogger<EmailNotifyService> _logger;
        public EmailNotifyService(ISmtpProvider smtpProvider, ILogger<EmailNotifyService> logger)
        {
            _smtpProvider = smtpProvider;
            _logger = logger;
        }
        public virtual Type SupportType => typeof(EmailNotice);

        public virtual void Send(Notice notice)
        {
            var email = notice as EmailNotice;
            MailMessage mailMessage = new MailMessage();
            mailMessage.Subject = email.Subject;
            mailMessage.Body = email.Content;
            mailMessage.IsBodyHtml = email.IsHtml;

            if (email.To != null)
            {
                foreach (var item in email.To)
                {
                    mailMessage.To.Add(new MailAddress(item));
                }
            }
            if (email.Cc != null)
            {
                foreach (var item in email.Cc)
                {
                    mailMessage.CC.Add(new MailAddress(item));
                }
            }
            if (email.Bcc != null)
            {
                foreach (var item in email.Bcc)
                {
                    mailMessage.Bcc.Add(new MailAddress(item));
                }
            }
            if (email.Attachments != null)
            {
                foreach (var item in email.Attachments)
                {
                    mailMessage.Attachments.Add(new Attachment(item));
                }
            }
            SmtpClient client = _smtpProvider.GetSmtpClient();
            if (client == null)
            {//If SMTP server is not ready save email to temp
                string tempEmlPath = Path.Combine(Directory.GetCurrentDirectory(), "Temp", "emails");
                Directory.CreateDirectory(tempEmlPath);
                client = new SmtpClient
                {
                    DeliveryMethod = SmtpDeliveryMethod.SpecifiedPickupDirectory,
                    PickupDirectoryLocation = tempEmlPath
                };
                _logger.LogError("SMTP Server is not ready, the email have temporary saved to {0}. for more information: {1}",
                tempEmlPath, "http://www.zkea.net/zkeacms/document/smtp-setting");
                if (email.From.IsNullOrWhiteSpace())
                {
                    email.From = "webmaster@zkea.net";
                }
            }

            if (email.From.IsNullOrWhiteSpace())
            {
                email.From = _smtpProvider.GetSmtpSetting().Email;
            }
            mailMessage.From = new MailAddress(email.From, email.DisplayName ?? email.From);

            client.SendCompleted += Client_SendCompleted;
            client.SendAsync(mailMessage, email);
        }

        private void Client_SendCompleted(object sender, System.ComponentModel.AsyncCompletedEventArgs e)
        {
            (sender as SmtpClient).Dispose();
            if (e.Error != null)
            {
                _logger.LogError(e.Error.ToString());
            }
        }
    }
}
