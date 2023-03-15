/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Extend;
using Easy.Notification;
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using ZKEACMS.Event;
using ZKEACMS.EventAction.Service;

namespace ZKEACMS.EventAction.ActionExecutor.Executors
{
    public class EmailExecutor : IActionExecutor
    {
        public const string Name = "actions/email";
        private readonly INotificationManager _notificationManager;
        private readonly IActionBodyService _actionBodyService;

        public EmailExecutor(IActionBodyService actionBodyService, INotificationManager notificationManager)
        {
            _actionBodyService = actionBodyService;
            _notificationManager = notificationManager;
        }

        public ServiceResult Execute(Arguments args, object model, EventArg e)
        {
            EmailMessage emailMessage = CreateEmailMessage(args);
            string emailBody = args.Named("body");

            if (emailBody.IsNullOrWhiteSpace() &&
                args.TryGetValue("bodyContentId", out string contentId) &&
                int.TryParse(contentId, out int id))
            {
                emailBody = _actionBodyService.RenderBody(id, model);
                var parsedResult = ParseEmailHeaders(emailBody);
                emailBody = parsedResult.EmailBody;
                MergeEmailHeader(emailMessage, parsedResult.Headers);
            }

            emailMessage.Content = emailBody;
            emailMessage.IsHtml = true;
            if (emailMessage.To == null || emailMessage.To.Length == 0) return new ServiceResult();

            _notificationManager.Send(emailMessage);
            return new ServiceResult();
        }
        private EmailMessage CreateEmailMessage(Arguments args)
        {
            var emailMessage = new EmailMessage
            {
                Subject = args.Named("subject"),
                To = ParseEmail(args.Named("to")),
                Cc = ParseEmail(args.Named("cc")),
                Bcc = ParseEmail(args.Named("bcc"))
            };
            return emailMessage;
        }

        string[] ParseEmail(string emailString)
        {
            if (emailString.IsNullOrWhiteSpace()) return new string[0];

            return emailString.Split(new char[] { ',', ';' }, StringSplitOptions.RemoveEmptyEntries);
        }
        (Dictionary<string, string> Headers, string EmailBody) ParseEmailHeaders(string emailBody)
        {
            using (StringReader emailReader = new StringReader(emailBody))
            {
                string line = null;
                bool isInHeaderPart = true;
                Dictionary<string, string> headers = new Dictionary<string, string>();
                StringBuilder bodyBuilder = new StringBuilder();
                while ((line = emailReader.ReadLine()) != null)
                {
                    if (isInHeaderPart && (isInHeaderPart = IsHeader(line)))
                    {
                        var headerValue = line.Split(':');
                        headers[headerValue[0]] = headerValue[1]?.Trim();
                    }
                    else
                    {
                        bodyBuilder.AppendLine(line);
                    }
                }

                return (headers, bodyBuilder.ToString());
            }
        }
        void MergeEmailHeader(EmailMessage emailMessage, Dictionary<string, string> headers)
        {
            emailMessage.Subject = headers.GetValueOrDefault("subject", emailMessage.Subject);
            emailMessage.To = emailMessage.To.Concat(ParseEmail(headers.GetValueOrDefault("to"))).ToArray();
            emailMessage.Cc = emailMessage.Cc.Concat(ParseEmail(headers.GetValueOrDefault("cc"))).ToArray();
            emailMessage.Bcc = emailMessage.Bcc.Concat(ParseEmail(headers.GetValueOrDefault("bcc"))).ToArray();
        }
        bool IsHeader(string line)
        {
            if (line.IsNullOrWhiteSpace()) return false;

            return line.StartsWith("subject:") || line.StartsWith("to:") || line.StartsWith("cc:") || line.StartsWith("bcc:");
        }
    }
}
