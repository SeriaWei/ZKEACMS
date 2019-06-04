/*!
 * http://www.zkea.net/
 * Copyright 2018 ZKEASOFT
 * http://www.zkea.net/licenses
 */

using Easy.Extend;
using Easy.Mvc.Plugin;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.IO;
using System.Text;
using ZKEACMS.Options;

namespace ZKEACMS.Updater.Service
{
    public class DbUpdaterService : IDbUpdaterService
    {
        private readonly DatabaseOption _databaseOption;
        private readonly IWebHostEnvironment _hostingEnvironment;
        public DbUpdaterService(DatabaseOption databaseOption, IWebHostEnvironment hostingEnvironment)
        {
            _databaseOption = databaseOption;
            _hostingEnvironment = hostingEnvironment;
        }

        public void UpdateDatabase()
        {
            using CurrentDbContext dbContext = new CurrentDbContext(_databaseOption);
            DbConnection dbConnection = dbContext.Database.GetDbConnection();
            DbTransaction dbTransaction = null;

            string[] scriptFiles = GetScriptFiles();
            if (scriptFiles.Length > 0 && dbConnection.State != ConnectionState.Open)
            {
                dbConnection.Open();
                dbTransaction = dbConnection.BeginTransaction();
            }
            try
            {
                foreach (var item in scriptFiles)
                {
                    Console.WriteLine("Executing: ({0})", item);
                    foreach (var sql in ReadSql(item))
                    {
                        if (sql.IsNullOrWhiteSpace()) continue;
                        using (var command = dbConnection.CreateCommand())
                        {
                            command.Transaction = dbTransaction;
                            command.CommandTimeout = 0;
                            command.CommandText = sql;
                            command.ExecuteNonQuery();
                        }
                    }

                }
            }
            finally
            {
                if (dbConnection.State == ConnectionState.Open)
                {
                    dbConnection.Close();
                }
            }

            foreach (var item in scriptFiles)
            {
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
        private IEnumerable<string> ReadSql(string scriptFile)
        {
            FileInfo file = new FileInfo(scriptFile);
            StringBuilder stringBuilder = new StringBuilder();
            using (FileStream fileStream = file.OpenRead())
            {
                using (StreamReader reader = new StreamReader(fileStream, Encoding.Unicode))
                {
                    string line = null;
                    while ((line = reader.ReadLine()) != null)
                    {
                        if (line.Equals("GO", StringComparison.OrdinalIgnoreCase))
                        {
                            if (stringBuilder.Length > 0)
                            {
                                yield return stringBuilder.ToString().Trim();
                            }
                            stringBuilder.Clear();
                        }
                        else
                        {
                            stringBuilder.AppendLine(line);
                        }
                    }
                }
            }
            if (stringBuilder.Length > 0)
            {
                yield return stringBuilder.ToString().Trim();
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
