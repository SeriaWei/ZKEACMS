/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Text;
using System.Net.Mail;
using System.Net;
using Easy.Extend;
using Microsoft.Extensions.Logging;
using System.IO;
using Easy.Notification.Queue;
using System.Threading.Tasks;

namespace Easy.Notification
{
    public class EmailNotificationProvider : INotificationProvider, IEmailNotification
    {
        private readonly ISmtpProvider _smtpProvider;
        private readonly IEmailQueue _emailQueue;
        private readonly ILogger<EmailNotificationProvider> _logger;
        public EmailNotificationProvider(ISmtpProvider smtpProvider,
            ILogger<EmailNotificationProvider> logger,
            IEmailQueue emailQueue)
        {
            _smtpProvider = smtpProvider;
            _emailQueue = emailQueue;
            _logger = logger;
        }
        public virtual Type SupportType => typeof(EmailMessage);

        public virtual void Send(Message message)
        {
            var email = (EmailMessage)message;
            if (_emailQueue != null)
            {
                var smtpSetting = _smtpProvider.GetSmtpSetting();
                if (smtpSetting == null)
                {
                    _logger.LogError("SMTP Server is not ready, the email was dropped. For more information:{0}", "http://www.zkea.net/zkeacms/document/smtp-setting");
                    return;
                }
                _emailQueue.Send(new EmailContext(email, smtpSetting));
            }
            else
            {
                SendEmail(email);
            }
        }
        public void SendEmail(EmailMessage email)
        {
            MailMessage mailMessage = ConvertToMailMessage(email);
            SmtpClient client = GetSmtpClient();

            try
            {
                client.Send(mailMessage);
            }
            finally
            {
                mailMessage.Dispose();
                client.Dispose();
            }
        }

        public async Task SendEmailAsync(EmailContext emailContext)
        {
            MailMessage mailMessage = ConvertToMailMessage(emailContext.EmailMessage);
            SmtpClient client = GetSmtpClient(emailContext.SmtpSetting);

            try
            {
                await client.SendMailAsync(mailMessage);
            }
            finally
            {
                mailMessage.Dispose();
                client.Dispose();
            }
        }
        private SmtpClient GetSmtpClient(SmtpSetting setting = null)
        {
            SmtpClient client = setting == null ? _smtpProvider.GetSmtpClient() : _smtpProvider.GetSmtpClient(setting);
            if (client == null)
            {//If SMTP server is not ready save email to temp
                string tempEmlPath = Path.Combine(Directory.GetCurrentDirectory(), "Temp", "emails");
                Directory.CreateDirectory(tempEmlPath);
                client = new SmtpClient
                {
                    DeliveryMethod = SmtpDeliveryMethod.SpecifiedPickupDirectory,
                    PickupDirectoryLocation = tempEmlPath
                };
                _logger.LogError("SMTP Server is not ready, the email have temporary saved to {0}. For more information: {1}",
                tempEmlPath, "http://www.zkea.net/zkeacms/document/smtp-setting");
            }

            return client;
        }

        private void SetEmailFrom(EmailMessage email, MailMessage mailMessage)
        {
            if (email.From.IsNullOrWhiteSpace())
            {
                email.From = _smtpProvider.GetSmtpSetting().Email;
            }
            if (email.From.IsNullOrWhiteSpace())
            {
                email.From = "webmaster@zkea.net";
            }
            mailMessage.From = new MailAddress(email.From);
        }

        private void SetAttachments(EmailMessage email, MailMessage mailMessage)
        {
            if (email.Attachments != null)
            {
                foreach (var item in email.Attachments)
                {
                    mailMessage.Attachments.Add(new System.Net.Mail.Attachment(new MemoryStream(item.Data), item.Name));
                }
            }
        }

        private void SetRecipient(EmailMessage email, MailMessage mailMessage)
        {
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
        }

        private MailMessage ConvertToMailMessage(EmailMessage email)
        {
            MailMessage mailMessage = new MailMessage();
            mailMessage.Subject = email.Subject;
            mailMessage.Body = email.Content;
            mailMessage.IsBodyHtml = email.IsHtml;
            mailMessage.SubjectEncoding = Encoding.UTF8;
            mailMessage.BodyEncoding = Encoding.UTF8;

            SetRecipient(email, mailMessage);
            SetAttachments(email, mailMessage);
            SetEmailFrom(email, mailMessage);

            return mailMessage;
        }

    }
}
