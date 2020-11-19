/*!
 * http://www.zkea.net/
 * Copyright 2018 ZKEASOFT
 * http://www.zkea.net/licenses
 */

using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using System;
using ZKEACMS.Options;
using ZKEACMS.Updater.Models;

namespace ZKEACMS.Updater
{
    public class CurrentDbContext : DbContext
    {
        private readonly DatabaseOption _dataBaseOption;
        public CurrentDbContext(DatabaseOption dataBaseOption)
        {
            _dataBaseOption = dataBaseOption;
        }
        public DbSet<DBVersion> DBVersion { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            switch (_dataBaseOption.DbType)
            {
                case Easy.DbTypes.MsSql:
                    {
                        optionsBuilder.UseSqlServer(_dataBaseOption.ConnectionString);
                        break;
                    }
                case Easy.DbTypes.MsSqlEarly:
                    {
                        throw new Exception("Starting with EF Core 3.0, EF will only generate SQL for paging that is only compatible with later SQL Server versions. Because SQL Server 2008 is no longer a supported product.");
                    }
                case Easy.DbTypes.Sqlite:
                    {
                        optionsBuilder.UseSqlite(_dataBaseOption.ConnectionString);
                        break;
                    }
                case Easy.DbTypes.MySql:
                    {
                        optionsBuilder.UseMySql(_dataBaseOption.ConnectionString, ServerVersion.AutoDetect(_dataBaseOption.ConnectionString));
                        break;
                    }
            }
        }
    }
}
