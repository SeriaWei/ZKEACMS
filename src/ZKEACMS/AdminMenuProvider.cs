/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using Easy.Extend;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Common.Models;

namespace ZKEACMS
{
    public class AdminMenuProvider : IAdminMenuProvider
    {
        public IEnumerable<AdminMenu> GetAdminMenus()
        {
            if (AdminMenus.Menus.Any(m => m.Group.IsNotNullAndWhiteSpace()))
            {
                for (int i = 0; i < AdminMenus.Menus.Count; i++)
                {
                    AdminMenu item = AdminMenus.Menus[i];
                    if (item.Group.IsNotNullAndWhiteSpace())
                    {
                        var group = AdminMenus.Menus.FirstOrDefault(m => m.Title == item.Group);
                        if (group != null && group.Children != null)
                        {
                            group.Children = group.Children.Concat(new AdminMenu[] { item });
                            AdminMenus.Menus.RemoveAt(i);
                            i--;
                        }
                        else
                        {
                            item.Group = null;
                        }
                    }
                }
            }
            foreach (var item in AdminMenus.Menus)
            {
                yield return item;
            }
        }
    }
}
