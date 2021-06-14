/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.Notification
{
    public class RazorEmailNotice : EmailNotice
    {
        public object Model { get; set; }
        /// <summary>
        /// Content root view path: ~/EmailTemplates/ResetPassword.cshtml.
        /// Or view in plugins: ~/wwwroot/Plugins/ZKEACMS.Article/EmailTemplates/ResetPassword.cshtml
        /// </summary>
        public string TemplatePath { get; set; }
    }
}
