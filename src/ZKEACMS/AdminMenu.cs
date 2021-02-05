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
                Title = "Ddashboard",
                Icon = "glyphicon-dashboard",
                Url = "~/admin",
                Order = 0
            },
            new AdminMenu
            {
                Title = "Layout",
                Icon = "glyphicon-th-list",
                Order = 1,
                Children = new List<AdminMenu>
                {
                    new AdminMenu
                    {
                        Title = "Layout List",
                        Url = "~/admin/layout",
                        Icon = "glyphicon-align-justify",
                        PermissionKey = PermissionKeys.ViewLayout
                    },
                    new AdminMenu
                    {
                        Title = "Layout Content",
                        Url = "~/admin/layout/layoutwidget",
                        Icon = "glyphicon-th-list",
                        PermissionKey = PermissionKeys.ViewLayout
                    }
                }
            },
            new AdminMenu
            {
                Title = "Page",
                Icon = "glyphicon-eye-open",
                Url = "~/admin/page",
                Order = 2,
                PermissionKey = PermissionKeys.ViewPage
            },
            new AdminMenu
            {
                Title = "Navigation",
                Icon = "glyphicon-retweet",
                Url = "~/admin/navigation",
                Order = 3,
                PermissionKey = PermissionKeys.ViewNavigation
            },
            new AdminMenu
            {
                Title = "Generate Content",
                Icon = "glyphicon-tree-deciduous",
                Order = 5,
                Children = new List<AdminMenu>
                {
                    new AdminMenu
                    {
                        Title = "Rule",
                        Icon = "glyphicon-cloud",
                        Url = "~/admin/rule",
                        Order = 1,
                        PermissionKey = PermissionKeys.ViewPage
                    },
                    new AdminMenu
                    {
                        Title = "Carousel",
                        Icon = "glyphicon-eye-open",
                        Url = "~/admin/carousel",
                        Order = 2,
                        PermissionKey = PermissionKeys.ViewCarousel
                    },
                    new AdminMenu
                    {
                        Title = "Media",
                        Icon = "glyphicon-picture",
                        Url = "~/admin/media",
                        Order = 3,
                        PermissionKey = PermissionKeys.ViewMedia
                    },
                    new AdminMenu
                    {
                        Title = "Theme",
                        Icon = "glyphicon-blackboard",
                        Url = "~/admin/theme",
                        Order = 4,
                        PermissionKey = PermissionKeys.ViewTheme
                    },
                    new AdminMenu
                    {
                        Title = "Theme Template",
                        Icon = "glyphicon-list-alt",
                        Url = "~/admin/template",
                        Order = 5,
                        PermissionKey = PermissionKeys.ViewTemplate
                    }
                }
            },
            new AdminMenu
            {
                Title = "System",
                Icon = "glyphicon-cog",
                Order = 1000,
                Children = new List<AdminMenu>
                {
                    new AdminMenu
                    {
                        Title = "User",
                        Icon = "glyphicon-user",
                        Url = "~/admin/user",
                        Order = 1,
                        PermissionKey = PermissionKeys.ViewUser
                    },
                    new AdminMenu
                    {
                        Title = "Change Password",
                        Icon = "glyphicon-lock",
                        Url = "~/admin/user/password",
                        Order = 2
                    },
                    new AdminMenu
                    {
                        Title = "Role",
                        Icon = "glyphicon-eye-open",
                        Url = "~/admin/roles",
                        Order = 3,
                        PermissionKey = PermissionKeys.ViewRole
                    },
                    new AdminMenu
                    {
                        Title = "Logs",
                        Icon = "glyphicon-exclamation-sign",
                        Url = "~/admin/eventviewer",
                        Order = 4,
                        PermissionKey = PermissionKeys.ManageEventViewer
                    },
                    new AdminMenu
                    {
                        Title = "SMTP Config",
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
                        Title = "Translate",
                        Icon = "glyphicon-cog",
                        Url = "~/admin/language",
                        Order = 7,
                        PermissionKey = PermissionKeys.ManageLanguage
                    },
                    new AdminMenu
                    {
                        Title = "Currency",
                        Icon = "glyphicon-usd",
                        Url = "~/admin/currencyoption/config",
                        Order = 8,
                        PermissionKey = PermissionKeys.ConfigCurrency
                    },
                    new AdminMenu
                    {
                        Title = "Plugins",
                        Icon = "glyphicon-equalizer",
                        Url = "~/admin/plugin",
                        Order = 99,
                        PermissionKey = PermissionKeys.ViewPlugins
                    },
                    new AdminMenu
                    {
                        Title = "Other Settings",
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
