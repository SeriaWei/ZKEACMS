using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.Notification
{
    public interface INotificationManager
    {
        void Send(Notice notice);
    }
}
