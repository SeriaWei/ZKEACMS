﻿/*!
 * http://www.zkea.net/
 * Copyright 2017 ZKEASOFT
 * http://www.zkea.net/licenses
 */

using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Diagnostics;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using ZKEACMS.Options;

namespace ZKEACMS.WebHost
{
    public class EntityFrameWorkConfigure : IOnDatabaseConfiguring
    {
        private readonly IOptions<DatabaseOption> _dataBaseOption;
        private readonly ILoggerFactory _loggerFactory;
        public EntityFrameWorkConfigure(IOptionsSnapshot<DatabaseOption> dataBaseOption, ILoggerFactory loggerFactory)
        {
            _dataBaseOption = dataBaseOption;
            _loggerFactory = loggerFactory;
        }
        public void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            switch (_dataBaseOption.Value.DbType)
            {
                case Easy.DbTypes.MsSql:
                    {
                        optionsBuilder.UseSqlServer(_dataBaseOption.Value.ConnectionString);
                        break;
                    }
                case Easy.DbTypes.MsSqlEarly:
                    {
                        optionsBuilder.UseSqlServer(_dataBaseOption.Value.ConnectionString, option => option.UseRowNumberForPaging());
                        break;
                    }
                case Easy.DbTypes.Sqlite:
                    {
                        optionsBuilder.UseSqlite(_dataBaseOption.Value.ConnectionString);
                        break;
                    }
                case Easy.DbTypes.MySql:
                    {
                        optionsBuilder.UseMySql(_dataBaseOption.Value.ConnectionString);
                        break;
                    }
            }

            optionsBuilder.ConfigureWarnings(warnings => warnings.Throw(RelationalEventId.QueryClientEvaluationWarning));
            optionsBuilder.UseLoggerFactory(_loggerFactory);
        }
    }
}
