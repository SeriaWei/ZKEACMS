/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy;
using Easy.Extend;
using Easy.Mvc.Resource;
using Easy.Mvc.Route;
using Easy.RepositoryPattern;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using System;
using System.Collections.Generic;
using ZKEACMS.Redirection.Models;
using ZKEACMS.Redirection.Service;
using ZKEACMS.WidgetTemplate;

namespace ZKEACMS.Redirection
{
    public class RedirectionPlug : PluginBase
    {
        public override IEnumerable<RouteDescriptor> RegistRoute()
        {
            yield return new RouteDescriptor
            {
                RouteName = "RedirectRoute",
                Template = "{*path}",
                Defaults = new { controller = "UrlRedirection", action = "RedirectTo" },
                Constraints = new { path = new RedirectRouteConstraint() },
                Priority = int.MaxValue
            };
        }

        public override IEnumerable<AdminMenu> AdminMenu()
        {
            yield return new AdminMenu
            {
                Group = "System",
                Title = "Url Redirect",
                Url = "~/admin/urlredirection",
                Icon = "glyphicon-random",
                Order = 12,
                PermissionKey = PermissionKeys.ViewUrlRedirect
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
            yield return new PermissionDescriptor
            {
                Module = "Setting",
                Title = "View URL Redirection",
                Description = "View URL Redirection",
                Key = PermissionKeys.ViewUrlRedirect
            };
            yield return new PermissionDescriptor
            {
                Module = "Setting",
                Title = "Manage URL Redirection",
                Description = "Manage URL Redirection",
                Key = PermissionKeys.ManageUrlRedirect
            };
        }

        public override IEnumerable<WidgetTemplateEntity> WidgetServiceTypes()
        {
            return null;
        }

        public override void ConfigureServices(IServiceCollection serviceCollection)
        {
            serviceCollection.AddSingleton<IOnModelCreating, EntityFrameWorkModelCreating>();

            serviceCollection.TryAddTransient<IUrlRedirectService, UrlRedirectService>();

            serviceCollection.ConfigureMetaData<UrlRedirect, UrlRedirectMetaData>();
        }
    }
}