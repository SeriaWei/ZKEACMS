/*!
 * http://www.zkea.net/
 * Copyright 2018 ZKEASOFT
 * http://www.zkea.net/licenses
 */


using Microsoft.EntityFrameworkCore;
using System;

namespace ZKEACMS.Updater.Service
{
    public interface IDbUpdaterService : IDisposable
    {
        void UpdateDatabase();
        bool UpdateDatabaseToVersion(DbContext dbContext, Easy.Version versionTo);
    }
}
