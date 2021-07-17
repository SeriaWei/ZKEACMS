/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */


using Easy;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.DbConnectionPool;
using ZKEACMS.Options;

namespace ZKEACMS
{
    public static class BuilderDatabase
    {
        public static void ConfigDatabase(this IServiceCollection services, IConfiguration configuration)
        {
            #region 数据库配置
            services.AddSingleton<IDatabaseConfiguring, EntityFrameWorkConfigure>();
            services.AddSingleton<IDbConnectionPool, SimpleDbConnectionPool>();
            //池的配置：
            //MaximumRetained规定池的容量（常态最大保有数量）。
            //MaximumRetained为0时，相当于不使用DbConnection池，
            //但因为在Request期间Connection是保持打开的，所以对许多场合还是有性能改善的。
            services.AddSingleton(new DbConnectionPool.Options() { MaximumRetained = 128 });
            //提供在Request期间租、还DbConnection的支持
            services.AddScoped<IConnectionHolder, TransientConnectionHolder>();
            services.AddDbContextOptions<CMSDbContext>();
            services.AddDbContext<CMSDbContext>();
            services.AddScoped<DbContextBase>((provider) => provider.GetService<CMSDbContext>());
            services.AddScoped<DbContext>((provider) => provider.GetService<CMSDbContext>());
            services.AddScoped<EasyDbContext>((provider) => provider.GetService<CMSDbContext>());
            DatabaseOption databaseOption = configuration.GetSection("Database").Get<DatabaseOption>();
            DataTableAttribute.IsLowerCaseTableNames = databaseOption.IsLowerCaseTableNames;
            services.AddSingleton(databaseOption);
            #endregion
        }
    }
}
