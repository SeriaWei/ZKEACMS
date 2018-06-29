/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Common.Models;
using ZKEACMS.Widget;

namespace ZKEACMS.Common.Service
{
    public class StyleSheetWidgetService : WidgetService<StyleSheetWidget>
    {
        public StyleSheetWidgetService(IWidgetBasePartService widgetService, IApplicationContext applicationContext, CMSDbContext dbContext)
            : base(widgetService, applicationContext, dbContext)
        {
        }
        public override DbSet<StyleSheetWidget> CurrentDbSet => (DbContext as CMSDbContext).StyleSheetWidget;
    }
}