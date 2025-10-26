/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.SiteSearch.Models;
using Easy;
using ZKEACMS.Widget;

namespace ZKEACMS.SiteSearch.Service
{
    public class SiteSearchWidgetService : SimpleWidgetService<SiteSearchWidget>
    {
        public SiteSearchWidgetService(IWidgetBasePartService widgetBasePartService, IApplicationContext applicationContext, CMSDbContext dbContext) 
            : base(widgetBasePartService, applicationContext, dbContext)
        {
        }
    }
}
