/*!
 * http://www.zkea.net/
 * Copyright 2017 ZKEASOFT
 * http://www.zkea.net/licenses
 */

using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using Pomelo.EntityFrameworkCore.MySql;

using Easy.Extend;
using System;
using Microsoft.Extensions.Options;
using ZKEACMS.Options;

namespace ZKEACMS.WebHost
{
    public class EntityFrameWorkConfigure : IOnConfiguring
    {
        private readonly IOptions<DatabaseOption> _dataBaseOption;
        public EntityFrameWorkConfigure(IOptions<DatabaseOption> dataBaseOption)
        {
            _dataBaseOption = dataBaseOption;
        }
        public void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
           
            if (_dataBaseOption.Value.DefaultConnection.IsNotNullAndWhiteSpace())
            {
                optionsBuilder.UseSqlServer(_dataBaseOption.Value.DefaultConnection);
            }
            else if (_dataBaseOption.Value.Sqlite.IsNotNullAndWhiteSpace())
            {
                optionsBuilder.UseSqlite(_dataBaseOption.Value.Sqlite);
            }
            else if (_dataBaseOption.Value.MySql.IsNotNullAndWhiteSpace())
            {
                optionsBuilder.UseMySql(_dataBaseOption.Value.MySql);
            }

        }
    }
}
