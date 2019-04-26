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
using ZKEACMS.TemplateImporter.Service;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using System.IO;
using System.IO.Compression;

namespace ZKEACMS.TemplateImporter
{
    public class TemplateImporterPlug : PluginBase
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
            style("Standard").Include("~/Plugins/ZKEACMS.Standard/Content/Standard.css");
        }

        public override IEnumerable<PermissionDescriptor> RegistPermission()
        {
            yield return new PermissionDescriptor(PermissionKeys.ViewTemplateImporter, "Standard", "View Standard", "");
            yield return new PermissionDescriptor(PermissionKeys.ManageTemplateImporter, "Standard", "Manage Standard", "");
        }

        public override IEnumerable<WidgetTemplateEntity> WidgetServiceTypes()
        {
            return null;
        }

        public override void ConfigureServices(IServiceCollection serviceCollection)
        {
            serviceCollection.AddTransient<IOnModelCreating, EntityFrameWorkModelCreating>();
            serviceCollection.AddTransient<ITemplateImporterService, TemplateImporterService>();
            serviceCollection.ConfigureMetaData<Models.TemplateImporter, Models.TemplateImporterMetaData>();
        }

        public override void ConfigureApplication(IApplicationBuilder app, IHostingEnvironment env)
        {
            string zipFile = Path.Combine(CurrentPluginPath, "Content", "vacayhome.zip");

            app.ApplicationServices.GetService<ITemplateImporterService>().Import(zipFile);
            base.ConfigureApplication(app, env);
        }
    }
}