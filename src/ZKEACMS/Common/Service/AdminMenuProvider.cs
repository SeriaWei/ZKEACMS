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
            yield return new AdminMenu
            {
                Title = "仪表盘",
                Icon = "glyphicon-dashboard",
                Url = "~/admin",
                Order = 0
            };
            yield return new AdminMenu
            {
                Title = "布局",
                Icon = "glyphicon-th-list",
                Order = 1,
                Children = new List<AdminMenu>
                {
                    new AdminMenu
                    {
                        Title = "布局列表",
                        Url = "~/admin/Layout",
                        Icon = "glyphicon-align-justify",
                        PermissionKey = PermissionKeys.ViewLayout
                    },
                    new AdminMenu
                    {
                        Title = "布局组件",
                        Url = "~/admin/Layout/LayoutWidget",
                        Icon = "glyphicon-th-list",
                        PermissionKey = PermissionKeys.ViewLayout
                    }
                }
            };
            yield return new AdminMenu
            {
                Title = "页面",
                Icon = "glyphicon-eye-open",
                Url = "~/admin/Page",
                Order = 2,
                PermissionKey = PermissionKeys.ViewPage
            };
            yield return new AdminMenu
            {
                Title = "导航",
                Icon = "glyphicon-retweet",
                Url = "~/admin/Navigation",
                Order = 3,
                PermissionKey = PermissionKeys.ViewNavigation
            };
            yield return new AdminMenu
            {
                Title = "主题",
                Icon = "glyphicon-blackboard",
                Url = "~/admin/Theme",
                Order = 4,
                PermissionKey = PermissionKeys.ViewTheme
            };
            yield return new AdminMenu
            {
                Title = "媒体库",
                Icon = "glyphicon-picture",
                Url = "~/admin/Media",
                Order = 5,
                PermissionKey = PermissionKeys.ViewMedia
            };
            yield return new AdminMenu
            {
                Title = "焦点图",
                Icon = "glyphicon-eye-open",
                Url = "~/admin/Carousel",
                Order = 6,
                PermissionKey = PermissionKeys.ViewCarousel
            };
            yield return new AdminMenu
            {
                Title = "系统",
                Icon = "glyphicon-cog",
                Order = 1000,
                Children = new List<AdminMenu>
                {
                    new AdminMenu
                    {
                        Title = "用户",
                        Icon = "glyphicon-user",
                        Url = "~/admin/User",
                        Order = 1,
                        PermissionKey = PermissionKeys.ViewUser
                    },
                    new AdminMenu
                    {
                        Title = "角色",
                        Icon = "glyphicon-eye-open",
                        Url = "~/admin/Roles",
                        Order = 2,
                        PermissionKey = PermissionKeys.ViewRole
                    },
                    new AdminMenu
                    {
                        Title = "系统设置",
                        Icon = "glyphicon-cog",
                        Url = "~/admin/ApplicationSetting",
                        Order = 3,
                        PermissionKey = PermissionKeys.ViewApplicationSetting
                    }
                }
            };
            foreach (var item in AdminMenus.Menus)
            {
                yield return item;
            }
        }
    }
}
