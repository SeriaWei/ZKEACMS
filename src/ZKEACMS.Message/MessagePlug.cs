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
                Title = "¡Ù—‘∞Â",
                Icon = "glyphicon-volume-up",
                Url = "~/Admin/Message",
                Order = 7,
                PermissionKey = PermissionKeys.ViewMessage
            };
        }

       

        public override IEnumerable<PermissionDescriptor> RegistPermission()
        {
            yield return new PermissionDescriptor(PermissionKeys.ViewMessage, "¡Ù—‘∞Â", "≤Èø¥¡Ù—‘", "");
            yield return new PermissionDescriptor(PermissionKeys.ManageMessage, "¡Ù—‘∞Â", "π‹¿Ì¡Ù—‘", "");
        }

        public override IEnumerable<Type> WidgetServiceTypes()
        {
            yield return typeof(MessageBoxWidgetService);
            yield return typeof(MessageWidgetService);
        }

        public override void ConfigureServices(IServiceCollection serviceCollection)
        {
            serviceCollection.AddTransient<IMessageService, MessageService>();

            serviceCollection.AddDbContext<MessageDbContext>();
        }

        protected override void InitScript(Func<string, ResourceHelper> script)
        {
            
        }

        protected override void InitStyle(Func<string, ResourceHelper> style)
        {
            
        }
    }
}