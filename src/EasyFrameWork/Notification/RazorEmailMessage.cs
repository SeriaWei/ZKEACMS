/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.Notification
{
    public class RazorEmailMessage : Message
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

        public object Model { get; set; }
        /// <summary>
        /// Content root view path: ~/EmailTemplates/ResetPassword.cshtml.
        /// Or view in plugins: ~/wwwroot/Plugins/ZKEACMS.Article/EmailTemplates/ResetPassword.cshtml
        /// </summary>
        public string TemplatePath { get; set; }
    }
}
