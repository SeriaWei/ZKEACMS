/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using ZKEACMS.PackageManger;
using Microsoft.AspNetCore.Hosting;
using Easy.Modules.DataDictionary;

namespace ZKEACMS.Widget
{
    public class DataDictionaryPackageInstaller : FilePackageInstaller
    {
        private readonly IDataDictionaryService _dataDictionaryService;
        public const string InstallerName = "DataDictionaryPackageInstaller";
        public DataDictionaryPackageInstaller(IWebHostEnvironment hostingEnvironment, IDataDictionaryService dataDictionaryService) : base(hostingEnvironment)
        {
            _dataDictionaryService = dataDictionaryService;
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
            DataDictionaryPackage package = NewPackageOnPacking() as DataDictionaryPackage;
            package.DataDictionary = obj as DataDictionaryEntity;
            return package;
        }
        public override FilePackage NewPackageOnPacking()
        {
            return new DataDictionaryPackage(PackageInstaller);
        }
        public override Type GetPackageType()
        {
            return typeof(DataDictionaryPackage);
        }
    }
}
