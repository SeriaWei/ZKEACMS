/* http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;

namespace ZKEACMS.WebHost
{
    public class EntityFrameWorkConfigure : IOnConfiguring
    {
        public void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(Easy.Builder.Configuration.GetSection("ConnectionStrings")["DefaultConnection"]);
        }
    }
}
