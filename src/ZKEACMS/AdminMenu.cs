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
        public string PluginName { get; set; }
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
                        Url = "~/admin/layout",
                        Icon = "glyphicon-align-justify",
                        PermissionKey = PermissionKeys.ViewLayout
                    },
                    new AdminMenu
                    {
                        Title = "布局内容",
                        Url = "~/admin/layout/layoutwidget",
                        Icon = "glyphicon-th-list",
                        PermissionKey = PermissionKeys.ViewLayout
                    }
                }
            },
            new AdminMenu
            {
                Title = "页面",
                Icon = "glyphicon-eye-open",
                Url = "~/admin/page",
                Order = 2,
                PermissionKey = PermissionKeys.ViewPage
            },
            new AdminMenu
            {
                Title = "导航",
                Icon = "glyphicon-retweet",
                Url = "~/admin/navigation",
                Order = 3,
                PermissionKey = PermissionKeys.ViewNavigation
            },
            new AdminMenu
            {
                Title = "基础内容",
                Icon = "glyphicon-tree-deciduous",
                Order = 5,
                Children = new List<AdminMenu>
                {
                    new AdminMenu
                    {
                        Title = "条件规则",
                        Icon = "glyphicon-cloud",
                        Url = "~/admin/rule",
                        Order = 1,
                        PermissionKey = PermissionKeys.ViewPage
                    },
                    new AdminMenu
                    {
                        Title = "焦点图",
                        Icon = "glyphicon-eye-open",
                        Url = "~/admin/carousel",
                        Order = 2,
                        PermissionKey = PermissionKeys.ViewCarousel
                    },
                    new AdminMenu
                    {
                        Title = "媒体库",
                        Icon = "glyphicon-picture",
                        Url = "~/admin/media",
                        Order = 3,
                        PermissionKey = PermissionKeys.ViewMedia
                    },
                    new AdminMenu
                    {
                        Title = "主题",
                        Icon = "glyphicon-blackboard",
                        Url = "~/admin/theme",
                        Order = 4,
                        PermissionKey = PermissionKeys.ViewTheme
                    },
                    new AdminMenu
                    {
                        Title = "主题模板",
                        Icon = "glyphicon-list-alt",
                        Url = "~/admin/template",
                        Order = 5,
                        PermissionKey = PermissionKeys.ViewTemplate
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
                        Url = "~/admin/user",
                        Order = 1,
                        PermissionKey = PermissionKeys.ViewUser
                    },
                    new AdminMenu
                    {
                        Title = "修改密码",
                        Icon = "glyphicon-lock",
                        Url = "~/admin/user/password",
                        Order = 2
                    },
                    new AdminMenu
                    {
                        Title = "角色",
                        Icon = "glyphicon-eye-open",
                        Url = "~/admin/roles",
                        Order = 3,
                        PermissionKey = PermissionKeys.ViewRole
                    },
                    new AdminMenu
                    {
                        Title = "错误日志",
                        Icon = "glyphicon-exclamation-sign",
                        Url = "~/admin/eventviewer",
                        Order = 4,
                        PermissionKey = PermissionKeys.ManageEventViewer
                    },
                    new AdminMenu
                    {
                        Title = "邮件设置",
                        Icon = "glyphicon-envelope",
                        Url = "~/admin/smtpsetting/config",
                        Order = 5,
                        PermissionKey = PermissionKeys.SMTPSetting
                    },
                    new AdminMenu
                    {
                        Title = "Robots.txt",
                        Icon = "glyphicon-magnet",
                        Url = "~/admin/robotssetting/config",
                        Order = 6,
                        PermissionKey = PermissionKeys.RobotsSetting
                    },
                    new AdminMenu
                    {
                        Title = "翻译",
                        Icon = "glyphicon-cog",
                        Url = "~/admin/language",
                        Order = 7,
                        PermissionKey = PermissionKeys.ManageLanguage
                    },
                    new AdminMenu
                    {
                        Title = "插件",
                        Icon = "glyphicon-equalizer",
                        Url = "~/admin/plugin",
                        Order = 99,
                        PermissionKey = PermissionKeys.ViewPlugins
                    },
                    new AdminMenu
                    {
                        Title = "其它设置",
                        Icon = "glyphicon-cog",
                        Url = "~/admin/applicationsetting",
                        Order = 100,
                        PermissionKey = PermissionKeys.ViewApplicationSetting
                    }
                }
            }
        };
        public static List<IEnumerable<AdminMenu>> PluginMenu { get; } = new List<IEnumerable<AdminMenu>>();
    }
}
