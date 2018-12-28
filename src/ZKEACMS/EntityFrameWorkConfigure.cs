/*!
 * http://www.zkea.net/
 * Copyright 2017 ZKEASOFT
 * http://www.zkea.net/licenses
 */

using System.Data.Common;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Diagnostics;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
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

            optionsBuilder.ConfigureWarnings(warnings => warnings.Throw(RelationalEventId.QueryClientEvaluationWarning));
            optionsBuilder.UseLoggerFactory(_loggerFactory);
        }
    }
}
