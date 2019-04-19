/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.Notification
{
    public interface INotifyService
    {
        Type SupportType { get; }
        void Send(Notice notice);
    }
}
