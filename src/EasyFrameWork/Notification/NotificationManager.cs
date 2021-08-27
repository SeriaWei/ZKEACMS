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
        private readonly IEnumerable<INotificationProvider> _notifyService;
        public NotificationManager(IEnumerable<INotificationProvider> notifyService)
        {
            _notifyService = notifyService;
        }
        public void Send(Message notice)
        {
            Type noticeType = notice.GetType();
            foreach (var item in _notifyService.Where(m => m.SupportType == noticeType))
            {
                item.Send(notice);
            }
        }
    }
}
