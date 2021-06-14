/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using Easy;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;

namespace ZKEACMS.ExtendField
{
    public class ExtendFieldService : ServiceBase<ExtendFieldEntity, CMSDbContext>, IExtendFieldService
    {
        public ExtendFieldService(IApplicationContext applicationContext, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
        }
    }
}