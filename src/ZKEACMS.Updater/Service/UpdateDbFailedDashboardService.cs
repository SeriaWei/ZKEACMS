using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Dashboard;
using ZKEACMS.Updater.ViewModel;

namespace ZKEACMS.Updater.Service
{
    public class UpdateDbFailedDashboardService : IDashboardPartDriveService
    {
        public DashboardPart Create()
        {
            string path = PluginBase.GetPath<UpdaterPlug>();
            string[] packages = Directory.GetFiles(Path.Combine(path, "DbScripts"), "package.*.zip");
            if (packages.Length == 0) return null;

            return new DashboardPart("Dashboard.UpdateDbFailed", new UpdateDbFailedViewModel
            {
                Packages = packages
            }, 0);
        }
    }
}
