/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using ZKEACMS.PackageManger;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Logging;

namespace ZKEACMS.Widget
{
    public class WidgetPackageInstaller : FilePackageInstaller
    {
        private readonly IWidgetActivator _widgetActivator;
        public const string InstallerName = "WidgetPackageInstaller";
        private readonly ILogger<WidgetPackageInstaller> _logger;
        public WidgetPackageInstaller(IWebHostEnvironment hostingEnvironment,
            IWidgetActivator widgetActivator,
            ILogger<WidgetPackageInstaller> logger) : base(hostingEnvironment)
        {
            _widgetActivator = widgetActivator;
            _logger = logger;
        }

        public override string PackageInstaller
        {
            get
            {
                return InstallerName;
            }
        }
        public override object Install(Package package)
        {
            var widgetPackage = package as WidgetPackage;
            if (widgetPackage == null || widgetPackage.Widget == null)
            {
                _logger.LogError("Package is not correct.");
                return null;
            }

            Type viewModelType = widgetPackage.Widget.GetViewModelType();
            if (viewModelType == null)
            {
                _logger.LogError("Package is not supported.");
                return null;
            }

            var widget = JsonConvert.DeserializeObject(JObject.Parse(package.ToString()).GetValue("Widget").ToString(), viewModelType, new JsonSerializerSettings
            {
                ContractResolver = new SerializeAllPropertyContractResolver()
            }) as WidgetBase;
            widget.PageId = null;
            widget.LayoutId = null;
            widget.ZoneId = null;
            widget.IsSystem = false;
            widget.IsTemplate = true;
            widgetPackage.Widget = widget;
            _widgetActivator.Create(widgetPackage.Widget).InstallWidget(widgetPackage);
            return null;
        }
        public override Package Pack(object obj)
        {
            var widget = obj as WidgetBase;
            var widgetService = _widgetActivator.Create(widget);
            var package = widgetService.PackWidget(widgetService.GetWidget(widget));
            IncludeAdditionalFilesToPackage(package);
            return package;
        }
        public override FilePackage NewPackageOnPacking()
        {
            return new WidgetPackage(PackageInstaller);
        }
        public override Type GetPackageType()
        {
            return typeof(WidgetPackage);
        }
    }
}
