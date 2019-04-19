/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy.Notification;
using System.Net;
using System.Net.Mail;
using ZKEACMS.Setting;
using Easy.Extend;
using System;

namespace ZKEACMS.SMTP
{
    public class SmtpProvider : ISmtpProvider
    {
        private readonly IApplicationSettingService _applicationSettingService;
        public SmtpProvider(IApplicationSettingService applicationSettingService)
        {
            _applicationSettingService = applicationSettingService;
        }
        public SmtpClient Get()
        {
            var setting = _applicationSettingService.Get<SmtpSetting>();
            if (setting.Host.IsNullOrWhiteSpace() || setting.Email.IsNullOrWhiteSpace())
            {
                throw new Exception("SMTP Server is not ready, for more information: https://www.zkea.net/codesnippet/detail/post-97.html");
            }
            SmtpClient client = null;
            if (setting.Port > 0)
            {
                client = new SmtpClient(setting.Host, setting.Port);
            }
            else
            {
                client = new SmtpClient(setting.Host);
            }
            client.UseDefaultCredentials = true;
            client.EnableSsl = setting.EnableSsl;
            client.Credentials = new NetworkCredential(setting.Email, setting.PassWord);
            return client;
        }
    }
}
