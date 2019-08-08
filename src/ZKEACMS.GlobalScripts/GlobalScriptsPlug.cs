/* http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses 
 *
 */
using Easy.Mvc.Resource;
using Easy.Mvc.Route;
using System;
using System.Collections.Generic;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Easy.RepositoryPattern;
using Easy;
using ZKEACMS.WidgetTemplate;
using ZKEACMS.GlobalScripts.Service;
using ZKEACMS.Event;

namespace ZKEACMS.GlobalScripts
{
    public class GlobalScriptsPlug : PluginBase
    {
        public override IEnumerable<RouteDescriptor> RegistRoute()
        {
            return null;
        }

        public override IEnumerable<AdminMenu> AdminMenu()
        {
            yield return new AdminMenu
            {
                Group = "系统",
                Title = "访客统计代码",
                Icon = "glyphicon-fire",
                PermissionKey = PermissionKeys.ManageStatisticsScript,
                Url = "~/admin/statisticsscript/config",
                Order = 13
            };
            yield return new AdminMenu
            {
                Group = "系统",
                Title = "在线客服代码",
                Icon = "glyphicon-comment",
                PermissionKey = PermissionKeys.ManageLiveChatScript,
                Url = "~/admin/livechatscript/config",
                Order = 14
            };
        }

        protected override void InitScript(Func<string, ResourceHelper> script)
        {

        }

        protected override void InitStyle(Func<string, ResourceHelper> style)
        {
        }

        public override IEnumerable<PermissionDescriptor> RegistPermission()
        {
            yield return new PermissionDescriptor(PermissionKeys.ManageStatisticsScript, "设置", "设置访客统计代码", "");
            yield return new PermissionDescriptor(PermissionKeys.ManageLiveChatScript, "设置", "设置在线客服代码", "");
        }

        public override IEnumerable<WidgetTemplateEntity> WidgetServiceTypes()
        {
            return null;
        }

        public override void ConfigureServices(IServiceCollection serviceCollection)
        {
            serviceCollection.AddTransient<IOnPageExecuted, LiveChatScriptProvider>();
            serviceCollection.AddTransient<IOnPageExecuted, StatisticsScriptProvider>();
            serviceCollection.ConfigureMetaData<Models.LiveChatScript, Models.LiveChatScriptMetaData>();
            serviceCollection.ConfigureMetaData<Models.StatisticsScript, Models.StatisticsScriptMetaData>();
        }
    }
}