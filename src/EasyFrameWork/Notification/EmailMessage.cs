/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.Notification
{
    public sealed class EmailMessage : Message
    {
        public string Subject { get; set; }
        public string Content { get; set; }
        public bool IsHtml { get; set; }
        public string From { get; set; }
        public string DisplayName { get; set; }
        public string[] To { get; set; }
        public string[] Cc { get; set; }
        public string[] Bcc { get; set; }
        public List<Attachment> Attachments { get; set; }
    }
}
