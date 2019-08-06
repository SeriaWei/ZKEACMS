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
            List<AdminMenu> menuResult = new List<AdminMenu>();
            foreach (var item in AdminMenus.Menus)
            {
                menuResult.Add(item);
            }
            foreach (var item in AdminMenus.PluginMenu)
            {
                menuResult.AddRange(item);
            }
            if (menuResult.Any(m => m.Group.IsNotNullAndWhiteSpace()))
            {
                for (int i = 0; i < menuResult.Count; i++)
                {
                    AdminMenu item = menuResult[i];
                    if (item.Group.IsNotNullAndWhiteSpace())
                    {
                        var group = menuResult.FirstOrDefault(m => m.Title == item.Group);
                        if (group != null && group.Children != null)
                        {
                            if (!group.Children.Any(m => m.Url == item.Url))
                            {
                                group.Children = group.Children.Concat(new AdminMenu[] { item });
                            }
                            item.Group = null;
                            menuResult.RemoveAt(i);
                            i--;
                        }
                        else
                        {
                            item.Group = null;
                        }
                    }
                }
            }
            foreach (var item in menuResult)
            {
                yield return item;
            }
        }
    }
}
