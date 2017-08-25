using Easy.Modules.User.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Notification
{
    public interface INotifyService
    {
        void ResetPassword(UserEntity user);
    }
}
