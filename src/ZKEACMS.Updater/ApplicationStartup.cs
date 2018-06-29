using Easy.StartTask;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Updater.Service;

namespace ZKEACMS.Updater
{
    public class ApplicationStartup : IStartTask
    {
        private readonly IDbUpdaterService _dbUpdaterService;
        public ApplicationStartup(IDbUpdaterService dbUpdaterService)
        {
            _dbUpdaterService = dbUpdaterService;
        }
        public void Excute()
        {
            _dbUpdaterService.UpdateDatabase();
        }
    }
}
