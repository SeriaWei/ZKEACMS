/* 
 * http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses 
 */

using Easy.Mvc.Resource;
using Easy.Mvc.Route;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using ZKEACMS.Message.Service;

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
                        Url = "~/Admin/Message",
                        Order = 1,
                        Icon = "glyphicon-volume-up",
                        PermissionKey = PermissionKeys.ViewMessage
                    },
                    new AdminMenu
                    {
                        Title = "评论",
                        Url = "~/Admin/Comments",
                        Order = 2,
                        Icon = "glyphicon-comment",
                        PermissionKey = PermissionKeys.ViewComments
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
        }

        public override IEnumerable<Type> WidgetServiceTypes()
        {
            yield return typeof(MessageBoxWidgetService);
            yield return typeof(MessageWidgetService);
            yield return typeof(CommentsWidgetService);
        }

        public override void ConfigureServices(IServiceCollection serviceCollection)
        {
            serviceCollection.AddTransient<IMessageService, MessageService>();
            serviceCollection.AddDbContext<MessageDbContext>();
            serviceCollection.AddTransient<ICommentsService, CommentsService>();
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