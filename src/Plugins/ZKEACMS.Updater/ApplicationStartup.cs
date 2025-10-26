/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.StartTask;
using ZKEACMS.Updater.Service;

namespace ZKEACMS.Updater
{
    public class ApplicationStartup : IAppStartTask
    {
        private readonly IDbUpdaterService _dbUpdaterService;
        public ApplicationStartup(IDbUpdaterService dbUpdaterService)
        {
            _dbUpdaterService = dbUpdaterService;
        }
        public void OnStartup()
        {
            _dbUpdaterService.UpdateDatabase();
        }
    }
}
