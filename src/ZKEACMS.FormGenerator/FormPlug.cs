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
using ZKEACMS.FormGenerator.Service;

namespace ZKEACMS.FormGenerator
{
    public class FormPlug : PluginBase
    {
        public override IEnumerable<RouteDescriptor> RegistRoute()
        {
            return null;
        }

        public override IEnumerable<AdminMenu> AdminMenu()
        {
            yield return new AdminMenu
            {
                Title = "自定义表单",
                Children = new List<AdminMenu>
                {
                    new AdminMenu
                    {
                        Title="表单",
                        Url="~/Admin/Form",
                        Icon="glyphicon-list-alt"
                    },
                    new AdminMenu
                    {
                        Title="表单数据"
                    }
                },
                Icon = "glyphicon-list-alt",
                Order = 10
            };
        }

        protected override void InitScript(Func<string, ResourceHelper> script)
        {
            script("field-setting")
                .Include("~/Plugins/ZKEACMS.FormGenerator/Scripts/fieldSettings.js", "~/Plugins/ZKEACMS.FormGenerator/Scripts/fieldSettings.min.js");
        }

        protected override void InitStyle(Func<string, ResourceHelper> style)
        {
            style("field-setting")
                .Include("~/Plugins/ZKEACMS.FormGenerator/Content/field-setting.css", "~/Plugins/ZKEACMS.FormGenerator/Content/field-setting.min.css");
        }

        public override IEnumerable<PermissionDescriptor> RegistPermission()
        {
            return null;
        }

        public override IEnumerable<Type> WidgetServiceTypes()
        {
            yield return typeof(FormWidgetService);
        }

        public override void ConfigureServices(IServiceCollection serviceCollection)
        {
            serviceCollection.TryAddTransient<IFormService, FormService>();

            serviceCollection.AddDbContext<FormGeneratorDbContext>();
        }
    }
}