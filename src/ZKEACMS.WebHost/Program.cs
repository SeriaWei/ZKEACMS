/*!
 * http://www.zkea.net/
 * Copyright 2018 ZKEASOFT
 * 深圳市纸壳软件有限公司
 * http://www.zkea.net/licenses
 */

using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Logging;

namespace ZKEACMS.WebHost
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateWebHostBuilder(args).Build().Run();
        }

        public static IWebHostBuilder CreateWebHostBuilder(string[] args) =>
            Microsoft.AspNetCore.WebHost.CreateDefaultBuilder(args)
                .UseStartup<Startup>()
            .ConfigureLogging((hostingContext, logging)=>
            {
                logging.AddConfiguration(hostingContext.Configuration.GetSection("Logging"));
                logging.AddConsole();
                logging.AddDebug();
                logging.AddEventSourceLogger();
            });
    }
}
