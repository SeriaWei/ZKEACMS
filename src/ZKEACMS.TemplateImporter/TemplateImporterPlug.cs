/* http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses 
 *
 */
using Easy.Mvc.Resource;
using Easy.Mvc.Route;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using ZKEACMS.TemplateImporter.Service;
using ZKEACMS.WidgetTemplate;

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
            yield return new AdminMenu
            {
                Group = "系统",
                Title = "导入静态模板",
                Icon = "glyphicon-briefcase",
                PermissionKey = PermissionKeys.ImportStaticHtmlTemplate,
                Url = "~/admin/templateimporter",
                Order = 15
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
            yield return new PermissionDescriptor(PermissionKeys.ImportStaticHtmlTemplate, "设置", "导入静态模板", "");
        }

        public override IEnumerable<WidgetTemplateEntity> WidgetServiceTypes()
        {
            return null;
        }

        public override void ConfigureServices(IServiceCollection serviceCollection)
        {
            serviceCollection.AddTransient<ITemplateImporterService, TemplateImporterService>();
            serviceCollection.AddTransient<IWdigetCreatorManager, WdigetCreatorManager>();
            serviceCollection.AddTransient<IWidgetCreatorService, JavaScriptWidgetCreatorService>();
            serviceCollection.AddTransient<IWidgetCreatorService, StyleSheetWidgetCreatorService>();
        }
    }
}