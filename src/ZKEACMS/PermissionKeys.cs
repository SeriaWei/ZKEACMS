/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Extend;
using Easy.Mvc.Authorize;
using Microsoft.AspNetCore.Authorization;
using System.Collections.Generic;

namespace ZKEACMS
{
    public class PermissionKeys
    {
        public const string ViewPage = "Page_View";
        public const string ManagePage = "Page_Manage";

        public const string ViewLayout = "Layout_View";
        public const string ManageLayout = "Layout_Manage";

        public const string ViewNavigation = "Navigation_View";
        public const string ManageNavigation = "Navigation_Manage";

        public const string ViewTheme = "Theme_View";
        public const string ManageTheme = "Theme_Manage";

        public const string ViewMedia = "Media_View";
        public const string ManageMedia = "Media_Manage";

        public const string ViewCarousel = "Carousel_View";
        public const string ManageCarousel = "Carousel_Manage";

        public const string ViewUser = "User_View";
        public const string ManageUser = "User_Manage";

        public const string ViewRole = "Role_View";
        public const string ManageRole = "Role_Manage";

        public const string ViewApplicationSetting = "ApplicationSetting_View";
        public const string ManageApplicationSetting = "ApplicationSetting_Manage";

        public const string ManageEventViewer = "EventViewer_Manage";
        public const string ManageLanguage = "Language_Manage";

        public const string SMTPSetting = "SMTPSetting";

        public const string RobotsSetting = "RobotsSetting";

        public const string ViewPlugins = "Plugin_View";

        public const string ViewTemplate = "Template_View";
        public const string ManageTemplate = "Template_Manage";
        public const string ConfigCurrency = "Config_Currency";

        public static List<PermissionDescriptor> KnownPermissions = new List<PermissionDescriptor>
        {
            new PermissionDescriptor { Module="Page And Layout",Title="View Pages",Key=ViewPage,Description="View Pages" },
            new PermissionDescriptor { Module="Page And Layout",Title="Manage Pages",Key=ManagePage,Description="Manage Pages" },
            new PermissionDescriptor { Module="Page And Layout",Title="View Layouts",Key=ViewLayout,Description="View Layouts" },
            new PermissionDescriptor { Module="Page And Layout",Title="Manage Layout",Key=ManageLayout,Description="Manage Layout" },
            new PermissionDescriptor { Module="Generate Content",Title="View Navigation",Key=ViewNavigation,Description="View Navigation" },
            new PermissionDescriptor { Module="Generate Content",Title="Manage Navigation",Key=ManageNavigation,Description="Manage Navigation" },
            new PermissionDescriptor { Module="Generate Content",Title="View Media",Key=ViewMedia,Description="View Media" },
            new PermissionDescriptor { Module="Generate Content",Title="Manage Media",Key=ManageMedia,Description="Manage Media" },
            new PermissionDescriptor { Module="Generate Content",Title="View Carousel",Key=ViewCarousel,Description="View Carousel" },
            new PermissionDescriptor { Module="Generate Content",Title="Manage Carousel",Key=ManageCarousel,Description="Manage Carousel" },

            new PermissionDescriptor { Module="Page And Layout",Title="View Template",Key=ViewTemplate,Description="View Template" },
            new PermissionDescriptor { Module="Page And Layout",Title="Manage Template",Key=ManageTemplate,Description="Manage Template" },

            new PermissionDescriptor { Module="Theme",Title="View Theme",Key=ViewTheme,Description="View Theme" },
            new PermissionDescriptor { Module="Theme",Title="Manage Theme",Key=ManageTheme,Description="Manage Theme" },
            new PermissionDescriptor { Module="Security",Title="View Users",Key=ViewUser,Description="View Users" },
            new PermissionDescriptor { Module="Security",Title="Manage Users",Key=ManageUser,Description="Manage Users" },
            new PermissionDescriptor { Module="Security",Title="View Role",Key=ViewRole,Description="View Role" },
            new PermissionDescriptor { Module="Security",Title="Manage Role",Key=ManageRole,Description="Manage Role" },
            new PermissionDescriptor { Module="Setting",Title="View Setting",Key=ViewApplicationSetting,Description="View Setting" },
            new PermissionDescriptor { Module="Setting",Title="Manage Setting",Key=ManageApplicationSetting,Description="Manage Setting" },
            new PermissionDescriptor { Module="Setting",Title="View Log",Key=ManageEventViewer,Description="View Log" },
            new PermissionDescriptor { Module="Setting",Title="Translate",Key=ManageLanguage,Description="Translate" },
            new PermissionDescriptor { Module="Setting",Title="SMTP Config",Key=SMTPSetting,Description="SMTP Config" },
            new PermissionDescriptor { Module="Setting",Title="Robots.txt",Key=RobotsSetting,Description="Robots.txt" },
            new PermissionDescriptor { Module="Setting",Title="Plugins",Key=ViewPlugins,Description="Plugins" },
            new PermissionDescriptor { Module="Setting",Title="Currency",Key=ConfigCurrency,Description="Currency" }
        };
        public static void Configure(AuthorizationOptions options)
        {
            KnownPermissions.Each(p =>
             {
                 options.AddPolicy(p.Key, configure =>
                 {
                     configure.Requirements.Add(new RolePolicyRequirement { Policy = p.Key });
                 });
             });
        }
    }
}
