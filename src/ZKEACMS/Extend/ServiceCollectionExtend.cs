/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Text;
using ZKEACMS.DbConnectionPool;

namespace ZKEACMS
{
    public static class ServiceCollectionExtend
    {
        public static void AddDbContextOptions<TDbContext>(this IServiceCollection services) where TDbContext : DbContext
        {
            services.AddScoped<DbContextOptions<TDbContext>>(sp =>
            {
                IConnectionHolder holder = sp.GetService<IConnectionHolder>();
                IDatabaseConfiguring configure = sp.GetService<IDatabaseConfiguring>();
                DbContextOptionsBuilder<TDbContext> optBuilder = new DbContextOptionsBuilder<TDbContext>();
                configure.OnConfiguring(optBuilder, holder.DbConnection);
                return optBuilder.Options;
            });
        }
    }
}
