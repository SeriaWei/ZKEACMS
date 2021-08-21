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
using EasyFrameWork.Notification.Queue;
using ZKEACMS.Mail.Queue;

namespace ZKEACMS.Mail
{
    public class MailPlug : PluginBase
    {
        public override IEnumerable<RouteDescriptor> RegistRoute()
        {
            return null;
        }

        public override IEnumerable<AdminMenu> AdminMenu()
        {
            return null;
        }

        protected override void InitScript(Func<string, ResourceHelper> script)
        {

        }

        protected override void InitStyle(Func<string, ResourceHelper> style)
        {

        }

        public override IEnumerable<PermissionDescriptor> RegistPermission()
        {
            return null;
        }

        public override IEnumerable<WidgetTemplateEntity> WidgetServiceTypes()
        {
            return null;
        }

        public override void ConfigureServices(IServiceCollection serviceCollection)
        {
            serviceCollection.Replace(new ServiceDescriptor(typeof(IEmailQueue), typeof(EmailQueue), ServiceLifetime.Singleton));

            serviceCollection.AddHostedService<SendEmailBackgroundService>();
        }
    }
}