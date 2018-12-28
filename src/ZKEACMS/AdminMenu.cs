/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;

namespace ZKEACMS
{
    public class AdminMenu
    {
        public string Title { get; set; }
        public string Url { get; set; }
        public string Icon { get; set; }
        public int Order { get; set; }
        public string PermissionKey { get; set; }
        public Func<bool> HasPermission { get; set; }
        public string Group { get; set; }
        public IEnumerable<AdminMenu> Children { get; set; }
    }
    public static class AdminMenus
    {
        public static List<AdminMenu> Menus { get; } = new List<AdminMenu>
        {
            new AdminMenu
            {
                Title = "仪表盘",
                Icon = "glyphicon-dashboard",
                Url = "~/admin",
                Order = 0
            },
            new AdminMenu
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
                        Title = "布局内容",
                        Url = "~/admin/Layout/LayoutWidget",
                        Icon = "glyphicon-th-list",
                        PermissionKey = PermissionKeys.ViewLayout
                    }
                }
            },
            new AdminMenu
            {
                Title = "页面",
                Icon = "glyphicon-eye-open",
                Url = "~/admin/Page",
                Order = 2,
                PermissionKey = PermissionKeys.ViewPage
            },
            new AdminMenu
            {
                Title = "导航",
                Icon = "glyphicon-retweet",
                Url = "~/admin/Navigation",
                Order = 3,
                PermissionKey = PermissionKeys.ViewNavigation
            },
            new AdminMenu
            {
                Title = "基础内容",
                Icon = "glyphicon-tree-deciduous",
                Order = 4,
                Children = new List<AdminMenu>
                {
                    new AdminMenu
                    {
                        Title = "条件规则",
                        Icon = "glyphicon-cloud",
                        Url = "~/admin/Rule",
                        Order = 1,
                        PermissionKey = PermissionKeys.ViewPage
                    },
                    new AdminMenu
                    {
                        Title = "焦点图",
                        Icon = "glyphicon-eye-open",
                        Url = "~/admin/Carousel",
                        Order = 2,
                        PermissionKey = PermissionKeys.ViewCarousel
                    },
                    new AdminMenu
                    {
                        Title = "媒体库",
                        Icon = "glyphicon-picture",
                        Url = "~/admin/Media",
                        Order = 3,
                        PermissionKey = PermissionKeys.ViewMedia
                    },
                    new AdminMenu
                    {
                        Title = "主题",
                        Icon = "glyphicon-blackboard",
                        Url = "~/admin/Theme",
                        Order = 4,
                        PermissionKey = PermissionKeys.ViewTheme
                    }
                }
            },
            new AdminMenu
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
                        Title = "修改密码",
                        Icon = "glyphicon-lock",
                        Url = "~/admin/User/PassWord",
                        Order = 2
                    },
                    new AdminMenu
                    {
                        Title = "角色",
                        Icon = "glyphicon-eye-open",
                        Url = "~/admin/Roles",
                        Order = 3,
                        PermissionKey = PermissionKeys.ViewRole
                    },
                    new AdminMenu
                    {
                        Title = "错误日志",
                        Icon = "glyphicon-exclamation-sign",
                        Url = "~/admin/EventViewer",
                        Order = 4,
                        PermissionKey = PermissionKeys.ManageEventViewer
                    },
                    new AdminMenu
                    {
                        Title = "邮件设置",
                        Icon = "glyphicon-envelope",
                        Url = "~/admin/SmtpSetting/Config",
                        Order = 5,
                        PermissionKey = PermissionKeys.SMTPSetting
                    },
                    new AdminMenu
                    {
                        Title = "Robots.txt",
                        Icon = "glyphicon-magnet",
                        Url = "~/admin/RobotsSetting/Config",
                        Order = 6,
                        PermissionKey = PermissionKeys.RobotsSetting
                    },
                    new AdminMenu
                    {
                        Title = "翻译",
                        Icon = "glyphicon-cog",
                        Url = "~/admin/Language",
                        Order = 7,
                        PermissionKey = PermissionKeys.ManageLanguage
                    },
                    new AdminMenu
                    {
                        Title = "其它设置",
                        Icon = "glyphicon-cog",
                        Url = "~/admin/ApplicationSetting",
                        Order = 100,
                        PermissionKey = PermissionKeys.ViewApplicationSetting
                    }
                }
            }
        };
    }
}
