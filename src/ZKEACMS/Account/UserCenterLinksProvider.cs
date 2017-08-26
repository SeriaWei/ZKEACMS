using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Account
{
    public class UserCenterLinksProvider : IUserCenterLinksProvider
    {
        public IEnumerable<AdminMenu> GetLinks()
        {
            yield return new AdminMenu { Order = 20, Title = "个人中心", Url = "~/Account" };
        }
    }
}
