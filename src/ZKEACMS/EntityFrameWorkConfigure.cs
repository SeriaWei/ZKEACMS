/*!
 * http://www.zkea.net/
 * Copyright 2017 ZKEASOFT
 * http://www.zkea.net/licenses
 */

using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
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
                        if (dbConnectionForReusing != null)
                            optionsBuilder.UseSqlServer(dbConnectionForReusing, option => option.UseRowNumberForPaging());
                        else
                            optionsBuilder.UseSqlServer(_dataBaseOption.ConnectionString, option => option.UseRowNumberForPaging());
                        break;
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
                            optionsBuilder.UseMySql(dbConnectionForReusing);
                        else
                            optionsBuilder.UseMySql(_dataBaseOption.ConnectionString);
                        break;
                    }
            }
            
            optionsBuilder.UseLoggerFactory(_loggerFactory);
        }
    }
}
