/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

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
            var notifies = _notifyService.Where(m => m.SupportType == noticeType);
            if (notifies.Any())
            {
                foreach (var item in notifies)
                {
                    item.Send(notice);
                }
            }
            else throw new Exception($"INotifyService for {noticeType} is not exists");
        }
    }
}
