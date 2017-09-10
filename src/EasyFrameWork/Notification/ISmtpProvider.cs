using System;
using System.Collections.Generic;
using System.Net.Mail;
using System.Text;

namespace Easy.Notification
{
    public interface ISmtpProvider
    {
        SmtpClient Get();
    }
}
