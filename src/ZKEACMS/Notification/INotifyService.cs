/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
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
