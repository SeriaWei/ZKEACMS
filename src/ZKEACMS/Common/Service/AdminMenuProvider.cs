using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Common.Models;

namespace ZKEACMS.Common.Service
{
    public class AdminMenuProvider : IAdminMenuProvider
    {
        public IEnumerable<AdminMenu> GetAdminMenus()
        {
            foreach (var item in AdminMenus.Menus)
            {
                yield return item;
            }
        }
    }
}
