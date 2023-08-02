/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Mvc.Resource;
using Easy.Mvc.Route;
using System;
using System.Collections.Generic;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Easy.RepositoryPattern;
using Easy;
using ZKEACMS.WidgetTemplate;
using ZKEACMS.EventAction.Service;
using ZKEACMS.EventAction.ActionExecutor;
using Easy.Extend;
using ZKEACMS.EventAction.HttpParser;
using ZKEACMS.PendingTask;

namespace ZKEACMS.EventAction
{
    public class EventActionPlug : PluginBase
    {
        public override IEnumerable<RouteDescriptor> RegistRoute()
        {
            return null;
        }

        public override IEnumerable<AdminMenu> AdminMenu()
        {
            yield return new AdminMenu
            {
                Title = "Event/Notification",
                Icon = "glyphicon-flash",
                Order = 14,
                Children = new List<AdminMenu>
                {
                    new AdminMenu
                    {
                        Title = "Notification",
                        Icon = "glyphicon-indent-left",
                        Url = "~/admin/eventaction",
                        Order = 0,
                        PermissionKey = PermissionKeys.ViewEventNotification
                    },
                    new AdminMenu
                    {
                        Title = "Notification Content",
                        Icon = "glyphicon-log-in",
                        Url = "~/admin/actionbody",
                        Order = 1,
                        PermissionKey = PermissionKeys.ViewNotificationContent
                    },
                    new AdminMenu
                    {
                        Title = "Pending Tasks",
                        Icon = "glyphicon-tasks",
                        Url = "~/admin/pendingtask",
                        Order = 2,
                        PermissionKey = PermissionKeys.ViewPendingTask
                    }
                }
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
            yield return new PermissionDescriptor(PermissionKeys.ViewEventNotification, "Event/Notification", "View Notification", "");
            yield return new PermissionDescriptor(PermissionKeys.ManageEventNotification, "Event/Notification", "Manage Notification", "");
            yield return new PermissionDescriptor(PermissionKeys.ViewNotificationContent, "Event/Notification", "View Notification Content", "");
            yield return new PermissionDescriptor(PermissionKeys.ManageNotificationContent, "Event/Notification", "Manage Notification Content", "");
            yield return new PermissionDescriptor(PermissionKeys.ViewPendingTask, "Event/Notification", "View Pending Task", "");
            yield return new PermissionDescriptor(PermissionKeys.ManagePendingTask, "Event/Notification", "Manage Pending Task", "");
        }

        public override IEnumerable<WidgetTemplateEntity> WidgetServiceTypes()
        {
            return null;
        }

        public override void ConfigureServices(IServiceCollection serviceCollection)
        {
            serviceCollection.AddTransient<IOnModelCreating, EntityFrameWorkModelCreating>();

            serviceCollection.AddTransient<IEventActionService, EventActionService>();
            serviceCollection.ConfigureMetaData<Models.EventAction, Models.EventActionMetaData>();

            serviceCollection.AddTransient<IPendingTaskService, PendingTaskService>();
            serviceCollection.AddTransient<IPendingTaskManagerService, PendingTaskManagerService>();
            serviceCollection.ConfigureMetaData<Models.PendingTaskEntity, Models.PendingTaskEntityMetaData>();

            serviceCollection.AddTransient<IActionBodyService, ActionBodyService>();
            serviceCollection.ConfigureMetaData<Models.ActionBody, Models.ActionBodyMetaData>();

            serviceCollection.RegistEvent<ActionExecutor.EventActionEventHandler>(Event.Events.All);
            serviceCollection.RegistPendingTask<HttpRequesetTaskHandler>(HttpRequesetTaskHandler.Name);

            serviceCollection.AddScoped<IExecutorManager, ExecutorManager>();
            serviceCollection.RegistActionExecutor<ActionExecutor.Executors.EmailExecutor>(ActionExecutor.Executors.EmailExecutor.Name);
            serviceCollection.RegistActionExecutor<ActionExecutor.Executors.HttpExecutor>(ActionExecutor.Executors.HttpExecutor.Name);

            serviceCollection.AddHostedService<PendingTaskBackgroundService>();
        }
    }
}