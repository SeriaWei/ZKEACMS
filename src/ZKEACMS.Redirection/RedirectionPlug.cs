/* http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses 
 */
using Easy.Mvc.Resource;
using Easy.Mvc.Route;
using System;
using System.Collections.Generic;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Easy.RepositoryPattern;
using ZKEACMS.Redirection.Service;
using Easy;
using ZKEACMS.Redirection.Models;
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
                Priority = 0
            };
        }

        public override IEnumerable<AdminMenu> AdminMenu()
        {
            yield return new AdminMenu
            {
                Title = "URL重定向",
                Url = "~/Admin/UrlRedirection",
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
                Module = "URL重定向",
                Title = "查看重定向",
                Description = "查看重定向",
                Key = PermissionKeys.ViewUrlRedirect
            };
            yield return new PermissionDescriptor
            {
                Module = "URL重定向",
                Title = "管理重定向",
                Description = "管理重定向",
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