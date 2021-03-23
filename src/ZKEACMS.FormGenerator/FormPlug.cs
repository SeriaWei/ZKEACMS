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
using Easy;
using ZKEACMS.FormGenerator.Models;
using ZKEACMS.WidgetTemplate;
using ZKEACMS.FormGenerator.Service.Validator;
using ZKEACMS.FormGenerator.EventHandler;

namespace ZKEACMS.FormGenerator
{
    public class FormPlug : PluginBase
    {
        public override IEnumerable<RouteDescriptor> RegistRoute()
        {
            yield return new RouteDescriptor
            {
                RouteName = "EditTemplate",
                Template = "Admin/FormGenerator/EditTemplate/{template}",
                Defaults = new { controller = "EditTemplate", action = "TemplateView" },
                Priority = 11
            };
            yield return new RouteDescriptor
            {
                RouteName = "PreviewTemplate",
                Template = "Admin/FormGenerator/PreviewTemplate/{template}",
                Defaults = new { controller = "PreviewTemplate", action = "TemplateView" },
                Priority = 11
            };
            yield return new RouteDescriptor
            {
                RouteName = "FormData",
                Template = "FormDataHandle/Submit",
                Defaults = new { controller = "FormData", action = "Submit" },
                Priority = 11
            };
        }

        public override IEnumerable<AdminMenu> AdminMenu()
        {
            yield return new AdminMenu
            {
                Title = "Form Generator",
                Children = new List<AdminMenu>
                {
                    new AdminMenu
                    {
                        Title="Form",
                        Url="~/admin/form",
                        Icon="glyphicon-list-alt",
                        PermissionKey=PermissionKeys.ViewForm
                    },
                    new AdminMenu
                    {
                        Title="Form Data",
                        Url="~/admin/formdata",
                        Icon="glyphicon-record",
                        PermissionKey=PermissionKeys.ViewFormData
                    }
                },
                Icon = "glyphicon-list-alt",
                Order = 12
            };
        }

        protected override void InitScript(Func<string, ResourceHelper> script)
        {
            script("field-setting")
                .Include("~/Plugins/ZKEACMS.FormGenerator/Scripts/fieldSettings.js", "~/Plugins/ZKEACMS.FormGenerator/Scripts/fieldSettings.min.js");

            script("form-widget")
                .Include("~/Plugins/ZKEACMS.FormGenerator/Scripts/form-widget.js", "~/Plugins/ZKEACMS.FormGenerator/Scripts/form-widget.min.js");

            script("distpicker")
                .Include("~/Plugins/ZKEACMS.FormGenerator/Scripts/distpicker.js", "~/Plugins/ZKEACMS.FormGenerator/Scripts/distpicker.min.js");
        }

        protected override void InitStyle(Func<string, ResourceHelper> style)
        {
            style("field-setting")
                .Include("~/Plugins/ZKEACMS.FormGenerator/Content/field-setting.css", "~/Plugins/ZKEACMS.FormGenerator/Content/field-setting.min.css");

            style("form-widget")
                .Include("~/Plugins/ZKEACMS.FormGenerator/Content/form-widget.css", "~/Plugins/ZKEACMS.FormGenerator/Content/form-widget.min.css");
        }

        public override IEnumerable<PermissionDescriptor> RegistPermission()
        {
            yield return new PermissionDescriptor(PermissionKeys.ViewForm, "Form Generator", "View Form", "");
            yield return new PermissionDescriptor(PermissionKeys.ManageForm, "Form Generator", "Manage Form", "");
            yield return new PermissionDescriptor(PermissionKeys.ViewFormData, "Form Generator", "View Form Data", "");
            yield return new PermissionDescriptor(PermissionKeys.ManageFormData, "Form Generator", "Manage Form Data", "");
            yield return new PermissionDescriptor(PermissionKeys.ExportFormData, "Form Generator", "Export Form Data", "");
        }

        public override IEnumerable<WidgetTemplateEntity> WidgetServiceTypes()
        {
            yield return new WidgetTemplateEntity<FormWidgetService>
            {
                Title = "Form",
                GroupName = "4.Form",
                PartialView = "Widget.Form",
                Thumbnail = "~/Plugins/ZKEACMS.FormGenerator/Content/images/Widget.Form.png",
                Order = 1
            };
        }

        public override void ConfigureServices(IServiceCollection serviceCollection)
        {
            serviceCollection.AddSingleton<IOnModelCreating, EntityFrameWorkModelCreating>();

            serviceCollection.AddTransient<IFormDataValidator, DateTimeFormDataValidator>();
            serviceCollection.AddTransient<IFormDataValidator, EmailFormDataValidator>();
            serviceCollection.AddTransient<IFormDataValidator, NumberFormDataValidator>();
            serviceCollection.AddTransient<IFormDataValidator, RequiredFormDataValidator>();
            serviceCollection.AddTransient<IFormDataValidator, MaxLengthFormDataValidator>();
            serviceCollection.AddTransient<IFormDataValidator, RegexPatternValidator>();
            serviceCollection.AddTransient<IFormDataValidator, PhoneFormDataValidator>();
            serviceCollection.AddTransient<IFormDataValidator, ValidCodeFormDataValidator>();

            serviceCollection.TryAddTransient<IFormService, FormService>();
            serviceCollection.TryAddTransient<IFormDataService, FormDataService>();
            serviceCollection.TryAddTransient<IFormDataItemService, FormDataItemService>();
            serviceCollection.TryAddTransient<IFormDataApiService, FormDataApiService>();

            serviceCollection.ConfigureMetaData<Form, FormMetaData>();
            serviceCollection.ConfigureMetaData<FormData, FormDataMetaData>();
            serviceCollection.ConfigureMetaData<FormWidget, FormWidgetMetaData>();

            serviceCollection.RegistEvent<NotifyOnFormDataSubmittedEventHandler>(Events.OnFormDataSubmitted);

            serviceCollection.Configure<FormWidget>(option =>
            {
                option.DataSourceLinkTitle = "Form";
                option.DataSourceLink = "~/admin/form";
            });            
        }
    }
}