/*!
 * http://www.zkea.net/
 * Copyright 2017 ZKEASOFT
 * http://www.zkea.net/licenses
 */

using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System;
using System.Data.Common;
using ZKEACMS.DbConnectionPool;
using ZKEACMS.Options;

namespace ZKEACMS
{
    public class EntityFrameWorkConfigure: IDatabaseConfiguring
    {
        private readonly DatabaseOption _dataBaseOption;
        private readonly ILoggerFactory _loggerFactory;
        public EntityFrameWorkConfigure(DatabaseOption dataBaseOption, ILoggerFactory loggerFactory)
        {
            _dataBaseOption = dataBaseOption;
            _loggerFactory = loggerFactory;
        }
        public void OnConfiguring(DbContextOptionsBuilder optionsBuilder, DbConnection dbConnectionForReusing)
        {
            switch (_dataBaseOption.DbType)
            {
                case Easy.DbTypes.MsSql:
                    {
                        if (dbConnectionForReusing != null)
                            optionsBuilder.UseSqlServer(dbConnectionForReusing);
                        else
                            optionsBuilder.UseSqlServer(_dataBaseOption.ConnectionString);
                        break;
                    }
                case Easy.DbTypes.MsSqlEarly:
                    {
                        throw new Exception("Starting with EF Core 3.0, EF will only generate SQL for paging that is only compatible with later SQL Server versions. Because SQL Server 2008 is no longer a supported product.");
                    }
                case Easy.DbTypes.Sqlite:
                    {
                        if (dbConnectionForReusing != null)
                            optionsBuilder.UseSqlite(dbConnectionForReusing);
                        else
                            optionsBuilder.UseSqlite(_dataBaseOption.ConnectionString);
                        break;
                    }
                case Easy.DbTypes.MySql:
                    {
                        if (dbConnectionForReusing != null)
                            optionsBuilder.UseMySql(dbConnectionForReusing, ServerVersion.AutoDetect(dbConnectionForReusing as MySqlConnector.MySqlConnection));
                        else
                            optionsBuilder.UseMySql(_dataBaseOption.ConnectionString , ServerVersion.AutoDetect(_dataBaseOption.ConnectionString));
                        break;
                    }
            }
            
            optionsBuilder.UseLoggerFactory(_loggerFactory);
        }
    }
}
