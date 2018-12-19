/*!
 * http://www.zkea.net/
 * Copyright 2017 ZKEASOFT
 * http://www.zkea.net/licenses
 */

using Easy.MetaData;

namespace ZKEACMS.Message.Models
{
    public class MessageNotificationConfig
    {
        public string MessageNotifyEmails { get; set; }
        public string CommentNotifyEmails { get; set; }
    }

    internal class MessageNotificationConfigMetaData : ViewMetaData<MessageNotificationConfig>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.MessageNotifyEmails).AsTextArea();
            ViewConfig(m => m.CommentNotifyEmails).AsTextArea();
        }
    }
}
