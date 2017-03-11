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

        public ThemePackageInstaller(IHostingEnvironment hostingEnvironment, IThemeService themeService) : base(hostingEnvironment)
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
                    if (oldTheme.IsActived)
                    {
                        newTheme.IsActived = true;
                    }
                    _themeService.Update(newTheme);
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
