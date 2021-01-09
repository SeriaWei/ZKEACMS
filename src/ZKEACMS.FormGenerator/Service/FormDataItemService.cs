/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.FormGenerator.Models;
using Microsoft.EntityFrameworkCore;
using Easy;

namespace ZKEACMS.FormGenerator.Service
{
    public class FormDataItemService : ServiceBase<FormDataItem, CMSDbContext>, IFormDataItemService
    {
        public FormDataItemService(IApplicationContext applicationContext, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
        }        
    }
}
