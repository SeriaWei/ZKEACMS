using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using ZKEACMS.PackageManger;
using Microsoft.AspNetCore.Hosting;

namespace ZKEACMS.Widget
{
    public class WidgetPackageInstaller : FilePackageInstaller
    {
        public WidgetPackageInstaller(IHostingEnvironment hostingEnvironment) : base(hostingEnvironment)
        {
        }

        public override string PackageInstaller
        {
            get
            {
                return "WidgetPackageInstaller";
            }
        }
        public override object Install(Package package)
        {
            base.Install(package);
            var widgetPackage = package as WidgetPackage;
            if (widgetPackage != null)
            {
                if(widgetPackage.Widget != null)
                {
                    var widget = JsonConvert.DeserializeObject(JObject.Parse(package.Content.ToString()).GetValue("Widget").ToString(), widgetPackage.Widget.GetViewModelType()) as WidgetBase;
                    widget.PageID = null;
                    widget.LayoutID = null;
                    widget.ZoneID = null;
                    widget.IsSystem = false;
                    widget.IsTemplate = true;
                    return widget;
                }
            }
            return null;
        }
        public override Package Pack(object obj)
        {
            //obj is widget
            var package = base.Pack(GetWidgetFiles());
            (package as WidgetPackage).Widget = obj as WidgetBase;
            return package;
        }
        public override FilePackage CreatePackage()
        {
            return new WidgetPackage(PackageInstaller);
        }
        public virtual IEnumerable<System.IO.FileInfo> GetWidgetFiles()
        {
            return null;
        }
    }
}
