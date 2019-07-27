/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy;
using Easy.Extend;
using Easy.RepositoryPattern;
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
        public override ServiceResult<ScriptWidget> Add(ScriptWidget item)
        {
            if (item.StyleClass.IsNullOrEmpty())
            {
                item.StyleClass = "full";
            }
            return base.Add(item);
        }
    }
}