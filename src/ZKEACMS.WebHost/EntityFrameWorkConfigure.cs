using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
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
