/* 
 * http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses 
 */

using Easy;
using Easy.Mvc.Resource;
using Easy.Mvc.Route;
using Easy.RepositoryPattern;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using ZKEACMS.Message.EventHandler;
using ZKEACMS.Message.Models;
using ZKEACMS.Message.Service;
using ZKEACMS.WidgetTemplate;

namespace ZKEACMS.Message
{
    public class MessagePlug : PluginBase
    {
        public override IEnumerable<RouteDescriptor> RegistRoute()
        {
            yield return new RouteDescriptor()
            {
                RouteName = "MessagePlug",
                Template = "Message-Handle/{action}",
                Defaults = new { controller = "MessageHandle" },
                Priority = 11
            };
        }

        public override IEnumerable<AdminMenu> AdminMenu()
        {
            yield return new AdminMenu
            {
                Title = "Message And Comments",
                Icon = "glyphicon-volume-up",
                Order = 7,
                Children = new List<AdminMenu>
                {
                    new AdminMenu
                    {
                        Title = "Message",
                        Url = "~/admin/message",
                        Order = 1,
                        Icon = "glyphicon-volume-up",
                        PermissionKey = PermissionKeys.ViewMessage
                    },
                    new AdminMenu
                    {
                        Title = "Comments",
                        Url = "~/admin/comments",
                        Order = 2,
                        Icon = "glyphicon-comment",
                        PermissionKey = PermissionKeys.ViewComments
                    },
                    new AdminMenu
                    {
                        Title = "Notify Email",
                        Url = "~/admin/messagenotification/config",
                        Order = 3,
                        Icon = "glyphicon-flag",
                        PermissionKey = PermissionKeys.ManageMessageNotification
                    }
                }
            };
        }



        public override IEnumerable<PermissionDescriptor> RegistPermission()
        {
            yield return new PermissionDescriptor(PermissionKeys.ViewMessage, "Message And Comments", "View Message", "");
            yield return new PermissionDescriptor(PermissionKeys.ManageMessage, "Message And Comments", "Manage Message", "");
            yield return new PermissionDescriptor(PermissionKeys.ViewComments, "Message And Comments", "View Comments", "");
            yield return new PermissionDescriptor(PermissionKeys.ManageComments, "Message And Comments", "Manage Comments", "");
            yield return new PermissionDescriptor(PermissionKeys.ManageMessageNotification, "Message And Comments", "Manage Notify Email", "");
        }

        public override IEnumerable<WidgetTemplateEntity> WidgetServiceTypes()
        {
            string groupName = "5.Message";
            yield return new WidgetTemplateEntity<CommentsWidgetService>
            {
                Title = "Comment Box",
                GroupName = groupName,
                PartialView = "Widget.Comments",
                Thumbnail = "~/Plugins/ZKEACMS.Message/Content/Image/Widget.Comments.png",
                Order = 1
            };
            yield return new WidgetTemplateEntity<MessageWidgetService>
            {
                Title = "Message Board",
                GroupName = groupName,
                PartialView = "Widget.Message",
                Thumbnail = "~/Plugins/ZKEACMS.Message/Content/Image/Widget.Message.png",
                Order = 2
            };
            yield return new WidgetTemplateEntity<MessageBoxWidgetService>
            {
                Title = "Message List",
                GroupName = groupName,
                PartialView = "Widget.MessageBox",
                Thumbnail = "~/Plugins/ZKEACMS.Message/Content/Image/Widget.MessageBox.png",
                Order = 3
            };
        }

        public override void ConfigureServices(IServiceCollection serviceCollection)
        {
            serviceCollection.AddSingleton<IOnModelCreating, EntityFrameWorkModelCreating>();

            serviceCollection.AddTransient<IMessageService, MessageService>();
            serviceCollection.AddTransient<ICommentsService, CommentsService>();

            serviceCollection.ConfigureMetaData<Comments, CommentsMetadata>();
            serviceCollection.ConfigureMetaData<CommentsWidget, CommentsWidgetMetaData>();
            serviceCollection.ConfigureMetaData<MessageBoxWidget, MessageBoxWidgetMetaData>();
            serviceCollection.ConfigureMetaData<MessageEntity, MessageMetaData>();
            serviceCollection.ConfigureMetaData<MessageWidget, MessageWidgetMetaData>();
            serviceCollection.ConfigureMetaData<MessageNotificationConfig, MessageNotificationConfigMetaData>();

            serviceCollection.RegistEvent<NotifyOnCommentsSubmittedEventHandler>(Events.OnCommentsSubmitted);
            serviceCollection.RegistEvent<NotifyOnMessageSubmittedEventHandler>(Events.OnMessageSubmitted);

            serviceCollection.Configure<MessageBoxWidget>(option =>
            {
                option.DataSourceLinkTitle = "Message";
                option.DataSourceLink = "~/admin/message";
            });
            serviceCollection.Configure<CommentsWidget>(option =>
            {
                option.DataSourceLinkTitle = "Comments";
                option.DataSourceLink = "~/admin/comments";
            });
            
        }

        protected override void InitScript(Func<string, ResourceHelper> script)
        {
            script("comments").Include("~/Plugins/ZKEACMS.Message/Scripts/comments.js", "~/Plugins/ZKEACMS.Message/Scripts/comments.min.js");
        }

        protected override void InitStyle(Func<string, ResourceHelper> style)
        {
            style("comments").Include("~/Plugins/ZKEACMS.Message/Content/comments.css", "~/Plugins/ZKEACMS.Message/Content/comments.min.css");
        }
    }
}