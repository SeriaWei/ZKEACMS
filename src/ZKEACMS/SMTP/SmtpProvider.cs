/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy.Notification;
using System.Net;
using System.Net.Mail;
using ZKEACMS.Setting;
using Easy.Extend;
using System;
using System.IO;

namespace ZKEACMS.SMTP
{
    public class SmtpProvider : ISmtpProvider
    {
        private readonly IApplicationSettingService _applicationSettingService;
        public SmtpProvider(IApplicationSettingService applicationSettingService)
        {
            _applicationSettingService = applicationSettingService;
        }
        public SmtpClient GetSmtpClient()
        {
            var setting = GetSmtpSetting();
            if (setting.Host.IsNullOrWhiteSpace() || setting.Email.IsNullOrWhiteSpace())
            {
                return null;
            }
            SmtpClient client;
            if (setting.Port > 0)
            {
                client = new SmtpClient(setting.Host, setting.Port);
            }
            else
            {
                client = new SmtpClient(setting.Host);
            }

            client.EnableSsl = setting.EnableSsl;
            client.Credentials = new NetworkCredential(setting.Email, setting.PassWord);

            return client;
        }

        public SmtpSetting GetSmtpSetting()
        {
            return _applicationSettingService.Get<SmtpSetting>();
        }
    }
}
