/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.Notification
{
    public class EmailNotice : Notice
    {
        public string Subject { get; set; }
        public string Content { get; set; }
        public bool IsHtml { get; set; }
        public string From { get; set; }
        public string DisplayName { get; set; }
        public string[] To { get; set; }
        public string[] Cc { get; set; }
        public string[] Bcc { get; set; }
        public string[] Attachments { get; set; }
    }
}
