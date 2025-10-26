/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.EventAction.Models;

namespace ZKEACMS.EventAction.Service
{
    public sealed class PendingTaskManagerService : ServiceBase<PendingTaskEntity>, IPendingTaskManagerService
    {
        public PendingTaskManagerService(IApplicationContext applicationContext, DbContext dbContext) : base(applicationContext, dbContext)
        {
        }
    }
}
