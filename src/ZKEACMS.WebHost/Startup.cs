/*!
 * http://www.zkea.net/
 * Copyright 2017 ZKEASOFT
 * 深圳市纸壳软件有限公司
 * http://www.zkea.net/licenses
 */

using Easy;
using Easy.Mvc.Resource;
using Easy.RepositoryPattern;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Microsoft.Extensions.Logging;

namespace ZKEACMS.WebHost
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }
        public IConfiguration Configuration { get; }

        public void ConfigureServices(IServiceCollection services)
        {
            services.ConfigureResource<DefaultResourceManager>();

            //services.AddScoped<IOnDatabaseConfiguring, EntityFrameWorkConfigure>();
            //
            services.AddSingleton<EntityFrameWorkConfigure>();
            if (!true)
            {//思路1：仅用DbContext池的模式
                services.AddDbContextPool<CMSDbContext>((sp, optionsBuilder) =>
                {
                    var configure = sp.GetService<EntityFrameWorkConfigure>();
                    configure.OnConfiguring(optionsBuilder, null);
                }, 128);
            }
            else
            {//思路2：仅用DbConnection池的模式
                //
                services.AddSingleton<Easy.SimpleDbConnectionPool>((sp) =>
                {
                    var option = sp.GetService<Options.DatabaseOption>();
                    //此方法负责从数据库选项中创建数据库连接。
                    //可返回null。
                    //返回null时，就没有了“池”和“保持数据库打开”这两项好处。
                    System.Func<System.Data.Common.DbConnection> funcCreateConnection = () =>
                      {
                          switch (option.DbType)
                          {
                              case Easy.DbTypes.MsSql:
                                  return null;
                              case Easy.DbTypes.MsSqlEarly:
                                  return null;
                              case Easy.DbTypes.Sqlite:
                                  {
                                      var result = new Microsoft.Data.Sqlite.SqliteConnection(option.ConnectionString);
                                      result.Open();
                                      //优化sqlite的用法
                                      using (var cmd = result.CreateCommand())
                                      {
                                          cmd.CommandText = "pragma journal_mode=wal;";
                                          cmd.CommandText += "pragma read_uncommitted=1;";
                                          cmd.ExecuteNonQuery();
                                      }
                                      return result;
                                  }
                              case Easy.DbTypes.MySql:
                                  return null;
                          }
                          return null;
                      };
                    var poolOptions = sp.GetService<Easy.SimpleDbConnectionPool.Options>();
                    var pool = new Easy.SimpleDbConnectionPool(poolOptions, funcCreateConnection);
                    return pool;
                });
                //池的配置：
                //MaximumRetained规定池的容量（常态最大保有数量）。
                //MaximumRetained为0时，相当于不使用DbConnection池，
                //但因为在Request期间Connection是保持打开的，所以对许多场合还是有性能改善的。
                services.AddSingleton(new Easy.SimpleDbConnectionPool.Options() { MaximumRetained = 128 });
                //提供在Request期间租、还DbConnection的支持
                services.AddScoped<Easy.SimpleDbConnectionPool.TransientObjectHolder>();

                services.AddScoped<Microsoft.EntityFrameworkCore.DbContextOptions<CMSDbContext>>(sp =>
                {
                    //租一个DbConnection（将在Request完成后还回，因为其Lifetime为Scoped类型）
                    var holder = sp.GetService<Easy.SimpleDbConnectionPool.TransientObjectHolder>();
                    //
                    var configure = sp.GetService<EntityFrameWorkConfigure>();
                    var optBuilder = new Microsoft.EntityFrameworkCore.DbContextOptionsBuilder<CMSDbContext>();
                    configure.OnConfiguring(optBuilder, holder.Object);
                    return optBuilder.Options;
                });
                services.AddDbContext<CMSDbContext>(ServiceLifetime.Scoped);
            }
            //思路3：
            //同时用DbContext池和DbConnection池？
            //应该是不可以的。
            //原因：用DbConextPool时，各个DbContext应该是共用着同一个DbContextOptionsBuilder；
            //我曾经想让某个DbContext使用“自己的”DbConnection，所以在OnConfiguring中修改了DbContextOptionsBuilder，
            //但这导致EntityFramework中抛出异常，说是DbContex在支持Pool时，不允许修改DbContextOptionsBuilder。
            //思路4：
            //自己写DbContext池，不使用EntityFramework提供的DbContextPool？
            //为什么自己写？自己写可以让池中的每个DbContext在Request结束时仍然保持DbConnection打开，
            //而EF提供的DbContextPool，似乎预先打开Connection的“技巧”对它没用（没有查源码找原因和解决办法）。
            //这个思路我试验过了。简单的测试证明，这个模式的性能是最好的。
            //但是经过考虑，不推荐用这个思路，原因是：
            //1）对现有代码的改动会稍微多一些；
            //2）不确定在Request之间这么简单的重新利用DbConext会不会导致在有数据修改的情况下出现“错乱”的现象。
            //（实际上即使没有数据修改时，也观察到了一个“错乱”：如果NavigationWidgetService里面不是对每个
            //NavigationEntity的IsCurrent都重新赋值的话，页面上导航栏的显示就“乱”了。）而EF在使用DbContextPool
            //的时候，肯定用了恰当的Reset动作。
            //3）从使用场合考虑，思路1或思路2提供的性能够用了，而且实现上更为简单易懂。
            //
            //总结：
            //1）探讨了几种性能改进思路，用sqlite数据库进行了简单测试对比。
            //2）sqlite数据库因为自身没有连接池，所以要是实际应用的话，推荐用思路2优化性能。
            //其它数据库本人未实测，但从原理来说，即便数据库自身有连接池，避免反复的打开、关闭也是有益的，
            //在EntityFramework的在线文档中也为此提供了一些指导，因此，应用思路2应该“至少没有坏处”。
            //只不过具体的性能改进程度，可能就比不上用sqlite的那种情况了。
            //3）sqlite建库时，通常日志模式选择“WAL”时写入性能更好。为避免手动升级数据库，
            //我在这里把它放到思路2的创建DbConnection后执行了。如果不用这个方式，建议在源代码库中把数据库修改一下。

            services.AddScoped<EasyDbContext>((provider) => provider.GetService<CMSDbContext>());

            services.UseZKEACMS(Configuration);
        }

        public void Configure(IApplicationBuilder app, IHostingEnvironment env, ILoggerFactory loggerFactory, IHttpContextAccessor httpContextAccessor)
        {
            loggerFactory.AddConsole(Configuration.GetSection("Logging"));
            loggerFactory.AddDebug();

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                loggerFactory.UseFileLog(env, app.ApplicationServices.GetService<IHttpContextAccessor>());
                app.UseExceptionHandler("/Error");
            }
            app.UseZKEACMS(env, httpContextAccessor);
        }
    }
}
