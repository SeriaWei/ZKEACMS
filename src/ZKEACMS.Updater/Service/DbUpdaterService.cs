using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Easy;
using Microsoft.Extensions.Options;
using ZKEACMS.Options;
using Microsoft.AspNetCore.Hosting;
using System.IO;
using Easy.Mvc.Plugin;

namespace ZKEACMS.Updater.Service
{
    public class DbUpdaterService : IDbUpdaterService
    {
        private readonly IOptions<DatabaseOption> _databaseOption;
        private readonly IHostingEnvironment _hostingEnvironment;
        public DbUpdaterService(IOptions<DatabaseOption> databaseOption, IHostingEnvironment hostingEnvironment)
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
