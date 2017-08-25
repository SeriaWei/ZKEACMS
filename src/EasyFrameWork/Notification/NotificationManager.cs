using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace Easy.Notification
{
    public class NotificationManager : INotificationManager
    {
        private readonly IEnumerable<INotifyService> _notifyService;
        public NotificationManager(IEnumerable<INotifyService> notifyService)
        {
            _notifyService = notifyService;
        }
        public void Send(Notice notice)
        {
            Type noticeType = notice.GetType();
            var notifyService = _notifyService.FirstOrDefault(m => m.SupportType == noticeType);
            if (notifyService != null)
            {
                notifyService.Send(notice);
            }
            else throw new Exception($"未找到类型{noticeType}对应的通知器");
        }
    }
}
