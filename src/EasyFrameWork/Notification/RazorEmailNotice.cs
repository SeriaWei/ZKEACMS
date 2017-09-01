using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.Notification
{
    public class RazorEmailNotice : EmailNotice
    {
        public object Model { get; set; }
        public string TemplatePath { get; set; }
    }
}
