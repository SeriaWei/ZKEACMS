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
                Title = "留言评论",
                Icon = "glyphicon-volume-up",
                Order = 7,
                Children = new List<AdminMenu>
                {
                    new AdminMenu
                    {
                        Title = "留言",
                        Url = "~/admin/message",
                        Order = 1,
                        Icon = "glyphicon-volume-up",
                        PermissionKey = PermissionKeys.ViewMessage
                    },
                    new AdminMenu
                    {
                        Title = "评论",
                        Url = "~/admin/comments",
                        Order = 2,
                        Icon = "glyphicon-comment",
                        PermissionKey = PermissionKeys.ViewComments
                    },
                    new AdminMenu
                    {
                        Title = "配置通知邮箱",
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
            yield return new PermissionDescriptor(PermissionKeys.ViewMessage, "留言评论", "查看留言", "");
            yield return new PermissionDescriptor(PermissionKeys.ManageMessage, "留言评论", "管理留言", "");
            yield return new PermissionDescriptor(PermissionKeys.ViewComments, "留言评论", "查看评论", "");
            yield return new PermissionDescriptor(PermissionKeys.ManageComments, "留言评论", "管理评论", "");
            yield return new PermissionDescriptor(PermissionKeys.ManageMessageNotification, "留言评论", "管理通知邮箱", "");
        }

        public override IEnumerable<WidgetTemplateEntity> WidgetServiceTypes()
        {
            string groupName = "5.消息";
            yield return new WidgetTemplateEntity<CommentsWidgetService>
            {
                Title = "评论箱",
                GroupName = groupName,
                PartialView = "Widget.Comments",
                Thumbnail = "~/Plugins/ZKEACMS.Message/Content/Image/Widget.Comments.png",
                Order = 1
            };
            yield return new WidgetTemplateEntity<MessageWidgetService>
            {
                Title = "留言板",
                GroupName = groupName,
                PartialView = "Widget.Message",
                Thumbnail = "~/Plugins/ZKEACMS.Message/Content/Image/Widget.Message.png",
                Order = 2
            };
            yield return new WidgetTemplateEntity<MessageBoxWidgetService>
            {
                Title = "留言内容",
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

            serviceCollection.Configure<MessageBoxWidget>(option =>
            {
                option.DataSourceLinkTitle = "留言";
                option.DataSourceLink = "~/admin/message";
            });
            serviceCollection.Configure<CommentsWidget>(option =>
            {
                option.DataSourceLinkTitle = "评论";
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