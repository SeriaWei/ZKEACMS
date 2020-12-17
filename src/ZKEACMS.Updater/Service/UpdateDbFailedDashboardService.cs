/*!
 * http://www.zkea.net/
 * Copyright 2020 ZKEASOFT
 * http://www.zkea.net/licenses
 */


using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Dashboard;
using ZKEACMS.Updater.Models;
using ZKEACMS.Updater.ViewModel;

namespace ZKEACMS.Updater.Service
{
    public class UpdateDbFailedDashboardService : IDashboardPartDriveService
    {
        private const int DBVersionRecord = 1;
        private readonly CMSDbContext _dbContext;

        public UpdateDbFailedDashboardService(CMSDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public DashboardPart Create()
        {
            var appVersion = Easy.Version.Parse(Version.VersionInfo);
            var dbVersion = _dbContext.Set<DBVersion>().Find(DBVersionRecord);
            if (appVersion == dbVersion) return null;

            string path = PluginBase.GetPath<UpdaterPlug>();
            string[] packages = Directory.GetFiles(Path.Combine(path, "DbScripts"), "package.*.zip");
            return new DashboardPart("Dashboard.UpdateDbFailed", new UpdateDbFailedViewModel
            {
                Packages = packages
            }, 0);
        }
    }
}
