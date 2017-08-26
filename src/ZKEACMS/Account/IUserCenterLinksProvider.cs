using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Account
{
    public interface IUserCenterLinksProvider
    {
        IEnumerable<AdminMenu> GetLinks();
    }
}
