/*!
 * http://www.zkea.net/
 * Copyright 2020 ZKEASOFT
 * http://www.zkea.net/licenses
 */


using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Event;

namespace ZKEACMS.Updater.Service
{
    public class UpdateDbOnDbCreatedEventHandler : IEventHandler
    {
        private readonly IDbUpdaterService _dbUpdaterService;
        public UpdateDbOnDbCreatedEventHandler(IDbUpdaterService dbUpdaterService)
        {
            _dbUpdaterService = dbUpdaterService;
        }

        public void Handle(object entity, EventArg e)
        {
            if (entity is DbContext dbContext)
            {
                _dbUpdaterService.UpdateDatabaseToVersion(dbContext, Easy.Version.Parse(Version.VersionInfo));
            }
        }
    }
}
