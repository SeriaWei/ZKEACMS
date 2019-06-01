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
using Easy.Modules.DataDictionary;

namespace ZKEACMS.Widget
{
    public class WidgetPackageInstaller : FilePackageInstaller
    {
        public WidgetPackageInstaller(IWebHostEnvironment hostingEnvironment) : base(hostingEnvironment)
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
                if (widgetPackage.Widget != null)
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

    public class DataDictionaryPackageInstaller : FilePackageInstaller
    {
        private readonly IDataDictionaryService _dataDictionaryService;
        public DataDictionaryPackageInstaller(IWebHostEnvironment hostingEnvironment, IDataDictionaryService dataDictionaryService) : base(hostingEnvironment)
        {
            _dataDictionaryService = dataDictionaryService;
        }

        public override string PackageInstaller
        {
            get
            {
                return "DataDictionaryPackageInstaller";
            }
        }
        public override object Install(Package package)
        {
            base.Install(package);
            DataDictionaryPackage dicPackage = package as DataDictionaryPackage;
            if (dicPackage != null)
            {
                var exists = _dataDictionaryService.Count(m => m.DicName == dicPackage.DataDictionary.DicName && m.DicValue == dicPackage.DataDictionary.DicValue);
                if (exists == 0)
                {
                    dicPackage.DataDictionary.ID = 0;
                    _dataDictionaryService.Add(dicPackage.DataDictionary);
                }
            }

            return null;
        }
        public override Package Pack(object obj)
        {
            DataDictionaryPackage package = null;
            if (OnPacking != null)
            {
                package = base.Pack(OnPacking()) as DataDictionaryPackage;
            }
            if (package == null)
            {
                package = CreatePackage() as DataDictionaryPackage;
            }
            package.DataDictionary = obj as DataDictionaryEntity;
            return package;
        }
        public override FilePackage CreatePackage()
        {
            return new DataDictionaryPackage(PackageInstaller);
        }
        public Func<IEnumerable<System.IO.FileInfo>> OnPacking { get; set; }
    }
}
