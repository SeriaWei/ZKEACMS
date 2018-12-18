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

        public static List<PermissionDescriptor> KnownPermissions = new List<PermissionDescriptor>
        {
            new PermissionDescriptor { Module="页面布局",Title="查看页面",Key=ViewPage,Description="查看页面" },
            new PermissionDescriptor { Module="页面布局",Title="管理页面",Key=ManagePage,Description="管理页面" },
            new PermissionDescriptor { Module="页面布局",Title="查看布局",Key=ViewLayout,Description="查看布局" },
            new PermissionDescriptor { Module="页面布局",Title="管理布局",Key=ManageLayout,Description="管理布局" },
            new PermissionDescriptor { Module="基础内容",Title="查看导航",Key=ViewNavigation,Description="查看导航" },
            new PermissionDescriptor { Module="基础内容",Title="管理导航",Key=ManageNavigation,Description="管理导航" },
            new PermissionDescriptor { Module="基础内容",Title="查看媒体库",Key=ViewMedia,Description="查看媒体库" },
            new PermissionDescriptor { Module="基础内容",Title="管理媒体库",Key=ManageMedia,Description="管理媒体库" },
            new PermissionDescriptor { Module="基础内容",Title="查看焦点图",Key=ViewCarousel,Description="查看焦点图" },
            new PermissionDescriptor { Module="基础内容",Title="管理焦点图",Key=ManageCarousel,Description="管理焦点图" },
            new PermissionDescriptor { Module="主题",Title="查看主题",Key=ViewTheme,Description="查看主题" },
            new PermissionDescriptor { Module="主题",Title="管理主题",Key=ManageTheme,Description="管理主题" },
            new PermissionDescriptor { Module="安全",Title="查看用户",Key=ViewUser,Description="查看用户" },
            new PermissionDescriptor { Module="安全",Title="管理用户",Key=ManageUser,Description="管理用户" },
            new PermissionDescriptor { Module="安全",Title="查看角色",Key=ViewRole,Description="查看角色" },
            new PermissionDescriptor { Module="安全",Title="管理角色",Key=ManageRole,Description="管理角色" },
            new PermissionDescriptor { Module="设置",Title="查看设置",Key=ViewApplicationSetting,Description="查看设置" },
            new PermissionDescriptor { Module="设置",Title="管理设置",Key=ManageApplicationSetting,Description="管理设置" },
            new PermissionDescriptor { Module="设置",Title="查看错误日志",Key=ManageEventViewer,Description="查看系统异常错误信息" },
            new PermissionDescriptor { Module="设置",Title="翻译",Key=ManageLanguage,Description="翻译系统文本、标签" },
            new PermissionDescriptor { Module="设置",Title="邮件服务器设置",Key=SMTPSetting,Description="邮箱服务器设置" },
            new PermissionDescriptor { Module="设置",Title="Robots.txt设置",Key=RobotsSetting,Description="Robots.txt设置" }
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
