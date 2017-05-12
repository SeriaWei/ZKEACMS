/*!
 * http://www.zkea.net/
 * Copyright 2017 ZKEASOFT
 * http://www.zkea.net/licenses
 */

using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using Easy.Extend;
using System;
using Microsoft.AspNetCore.Http;
using System.IO;
using Microsoft.AspNetCore.Hosting;

namespace ZKEACMS.Colony
{
    public class EntityFrameWorkConfigure : IOnConfiguring
    {
        public void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            var host = Easy.ServiceLocator.GetService<IHttpContextAccessor>().HttpContext.Request.Host.Value.ToLower().Replace("www.", "");
            string appData = "App_Data";
            const string dataBaseFile = "{0}.sqlite";

            var file = Path.Combine(Easy.ServiceLocator.GetService<IHostingEnvironment>().WebRootPath, appData, dataBaseFile.FormatWith(host));
            if (File.Exists(file))
            {
                optionsBuilder.UseSqlite("Data Source=" + Path.Combine(appData, dataBaseFile.FormatWith(host)));
            }
            else
            {
                optionsBuilder.UseSqlite("Data Source=" + Path.Combine(appData, dataBaseFile.FormatWith("Database")));
            }

        }
    }
}
