﻿using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Diagnostics;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Options;

namespace ZKEACMS.Updater
{
    public class CurrentDbContext : DbContext
    {
        private readonly IOptions<DatabaseOption> _dataBaseOption;
        public CurrentDbContext(IOptions<DatabaseOption> dataBaseOption)
        {
            _dataBaseOption = dataBaseOption;
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
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
        }
    }
}
