/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Common.Models;
using ZKEACMS.Widget;

namespace ZKEACMS.Common.Service
{
    public class ScriptWidgetService : WidgetService<ScriptWidget, CMSDbContext>
    {
        public ScriptWidgetService(IWidgetBasePartService widgetService, IApplicationContext applicationContext)
            : base(widgetService, applicationContext)
        {
        }

        public override DbSet<ScriptWidget> CurrentDbSet
        {
            get
            {
                return DbContext.ScriptWidget;
            }
        }
    }
}