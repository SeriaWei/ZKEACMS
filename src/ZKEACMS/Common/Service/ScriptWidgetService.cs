/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using Easy;
using Easy.Extend;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Common.Models;
using ZKEACMS.Widget;

namespace ZKEACMS.Common.Service
{
    public class ScriptWidgetService : WidgetService<ScriptWidget>
    {
        public ScriptWidgetService(IWidgetBasePartService widgetService, IApplicationContext applicationContext, CMSDbContext dbContext)
            : base(widgetService, applicationContext, dbContext)
        {
        }
        public override DbSet<ScriptWidget> CurrentDbSet => DbContext.ScriptWidget;
        public override ErrorOr<ScriptWidget> Add(ScriptWidget item)
        {
            if (item.StyleClass.IsNullOrEmpty())
            {
                item.StyleClass = "full";
            }
            return base.Add(item);
        }
    }
}