using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Easy.Notification
{
    public interface IEmailNotification
    {
        void Send(EmailMessage email);
    }
}
