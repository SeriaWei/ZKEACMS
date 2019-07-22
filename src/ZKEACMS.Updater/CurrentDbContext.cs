/*!
 * http://www.zkea.net/
 * Copyright 2018 ZKEASOFT
 * http://www.zkea.net/licenses
 */

using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using ZKEACMS.Options;

namespace ZKEACMS.Updater
{
    public class CurrentDbContext : DbContext
    {
        private readonly DatabaseOption _dataBaseOption;
        public CurrentDbContext(DatabaseOption dataBaseOption)
        {
            _dataBaseOption = dataBaseOption;
        }

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
                        optionsBuilder.UseSqlServer(_dataBaseOption.ConnectionString, option => option.UseRowNumberForPaging());
                        break;
                    }
                case Easy.DbTypes.Sqlite:
                    {
                        optionsBuilder.UseSqlite(_dataBaseOption.ConnectionString);
                        break;
                    }
                case Easy.DbTypes.MySql:
                    {
                        optionsBuilder.UseMySql(_dataBaseOption.ConnectionString);
                        break;
                    }
            }
        }
    }
}
