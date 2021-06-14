/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Net.Mail;
using System.Text;

namespace Easy.Notification
{
    public interface ISmtpProvider
    {
        SmtpClient GetSmtpClient();
        SmtpSetting GetSmtpSetting();
    }
}
