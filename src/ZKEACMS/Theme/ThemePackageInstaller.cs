/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using Easy.Serializer;
using Microsoft.AspNetCore.Hosting;
using ZKEACMS.PackageManger;

namespace ZKEACMS.Theme
{
    public class ThemePackageInstaller : FilePackageInstaller
    {
        public const string InstallerName = "ThemePackageInstaller";
        private const string ThemePath = "~/themes";
        private readonly IThemeService _themeService;

        public ThemePackageInstaller(IWebHostEnvironment hostingEnvironment, IThemeService themeService) : base(hostingEnvironment)
        {
            _themeService = themeService;
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
            var themePackage = package as ThemePackage;
            if (themePackage != null)
            {
                var newTheme = themePackage.Theme;
                newTheme.IsActived = false;
                if (_themeService.Count(m => m.ID == newTheme.ID) == 0)
                {
                    _themeService.Add(newTheme);
                }
                else
                {
                    var oldTheme = _themeService.Get(newTheme.ID);
                    oldTheme.Description = newTheme.Description;
                    oldTheme.Thumbnail = newTheme.Thumbnail;
                    oldTheme.Title = newTheme.Title;
                    oldTheme.Url = newTheme.Url;
                    oldTheme.UrlDebugger = newTheme.UrlDebugger;
                    _themeService.Update(oldTheme);
                }
            }
            return package;
        }
        public override Package Pack(object obj)
        {
            var theme = _themeService.Get(obj.ToString());
            IncludeFile(theme.Thumbnail);
            IncludeFile(theme.UrlDebugger);
            IncludeFile(theme.Url);
            IncludeFilesInFolder(ThemePath + '/' + obj.ToString());
            var package = base.Pack(null);
            (package as ThemePackage).Theme = theme;
            return package;
        }
        public override FilePackage NewPackageOnPacking()
        {
            return new ThemePackage(PackageInstaller);
        }
        public override Type GetPackageType()
        {
            return typeof(ThemePackage);
        }
    }
}
