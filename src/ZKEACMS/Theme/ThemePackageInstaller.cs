/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using Microsoft.AspNetCore.Hosting;
using ZKEACMS.PackageManger;

namespace ZKEACMS.Theme
{
    public class ThemePackageInstaller : FilePackageInstaller
    {
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
                return "ThemePackageInstaller";
            }
        }
        private string ResetPath(string path)
        {
            return path.Replace("~/Themes", ThemePath);
        }
        public override object Install(Package package)
        {
            var filePackage = package as FilePackage;
            if (filePackage != null && filePackage.Files != null)
            {
                filePackage.Files.ForEach(file =>
                {
                    file.FilePath = ResetPath(file.FilePath);
                });
            }
            base.Install(package);
            var themePackage = package as ThemePackage;
            if (themePackage != null)
            {
                var newTheme = themePackage.Theme;
                newTheme.Url = ResetPath(newTheme.Url);
                newTheme.UrlDebugger = ResetPath(newTheme.UrlDebugger);
                newTheme.Thumbnail = ResetPath(newTheme.Thumbnail);
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
            //obj is theme id
            string path = Path.Combine(MapPath(ThemePath), obj.ToString());
            if (Directory.Exists(path))
            {
                var theme = _themeService.Get(obj.ToString());
                var package = base.Pack(new DirectoryInfo(path));
                (package as ThemePackage).Theme = theme;
                return package;
            }
            return null;
        }
        public override FilePackage CreatePackage()
        {
            return new ThemePackage(PackageInstaller);
        }
    }
}
