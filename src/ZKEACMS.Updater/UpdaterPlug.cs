/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Mvc.Resource;
using Easy.Mvc.Route;
using Easy.RepositoryPattern;
using Easy.StartTask;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using ZKEACMS.Dashboard;
using ZKEACMS.Event;
using ZKEACMS.Updater.Models;
using ZKEACMS.Updater.Service;
using ZKEACMS.WidgetTemplate;

namespace ZKEACMS.Updater
{
    public class UpdaterPlug : PluginBase
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
            serviceCollection.AddTransient<IOnModelCreating, EntityFrameWorkModelCreating>();
            serviceCollection.AddTransient<IStartTask, ApplicationStartup>();
            serviceCollection.AddTransient<IDbUpdaterService, DbUpdaterService>();
            serviceCollection.AddTransient<IDashboardPartDriveService, UpdateDbFailedDashboardService>();
            serviceCollection.RegistEvent<UpdateDbOnDbCreatedEventHandler>(Events.OnDatabaseCreated);

            var configuration = new ConfigurationBuilder()
             .SetBasePath(CurrentPluginPath)
             .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true).Build();

            serviceCollection.Configure<DBVersionOption>(configuration.GetSection("DBVersionOption"));
        }
    }
}