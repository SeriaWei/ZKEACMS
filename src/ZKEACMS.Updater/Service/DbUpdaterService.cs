/*!
 * http://www.zkea.net/
 * Copyright 2018 ZKEASOFT
 * http://www.zkea.net/licenses
 */

using Easy.Mvc.Plugin;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using System;
using System.IO;
using ZKEACMS.Options;

namespace ZKEACMS.Updater.Service
{
    public class DbUpdaterService : IDbUpdaterService
    {
        private readonly DatabaseOption _databaseOption;
        private readonly IHostingEnvironment _hostingEnvironment;
        public DbUpdaterService(DatabaseOption databaseOption, IHostingEnvironment hostingEnvironment)
        {
            _databaseOption = databaseOption;
            _hostingEnvironment = hostingEnvironment;
        }

        public void UpdateDatabase()
        {
            var dbContext = new CurrentDbContext(_databaseOption);
            foreach (var item in GetScriptFiles())
            {
                Console.WriteLine("Executing: ({0})", item);
                dbContext.Database.ExecuteSqlCommand(File.ReadAllText(item, System.Text.Encoding.UTF8));
                try
                {
                    File.Delete(item);
                }
                catch
                {
                    Console.WriteLine("Query executed successfully, but failed to delete the script! Please delete it to prevent execution again.");
                }
            }
        }

        private string[] GetScriptFiles()
        {
            string path = _hostingEnvironment.IsDevelopment() ?
                new DirectoryInfo(_hostingEnvironment.ContentRootPath).Parent.FullName :
                Path.Combine(_hostingEnvironment.WebRootPath, Loader.PluginFolder);

            return Directory.GetFiles(Path.Combine(path, "ZKEACMS.Updater", "DbScripts"), "*.sql");
        }
    }
}
