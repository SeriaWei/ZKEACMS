/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Account
{
    public class UserCenterLinksProvider : IUserCenterLinksProvider
    {
        public IEnumerable<AdminMenu> GetLinks()
        {
            yield return new AdminMenu { Order = 20, Title = "个人中心", Url = "~/account" };
        }
    }
}
