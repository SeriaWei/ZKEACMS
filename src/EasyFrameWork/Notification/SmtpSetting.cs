﻿/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Constant;
using Easy.MetaData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Easy.Notification
{
    public class SmtpSetting
    {
        public string Host { get; set; }
        public int Port { get; set; }
        public string Email { get; set; }
        public string PassWord { get; set; }
        public bool EnableSsl { get; set; }
    }
    class SmtpSettingMetaData : ViewMetaData<SmtpSetting>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.Host).AsTextBox().Required();
            ViewConfig(m => m.Port).AsTextBox().RegularExpression(RegularExpression.Integer);
            ViewConfig(m => m.Email).AsTextBox().Required();
            ViewConfig(m => m.PassWord).AsPassWord().Required();
        }
    }
}
