/* http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Common.Models;
using ZKEACMS.Widget;

namespace ZKEACMS.Common.Service
{
    public class HtmlWidgetService : WidgetService<HtmlWidget>
    {
        public HtmlWidgetService(IWidgetBasePartService widgetService, IApplicationContext applicationContext, CMSDbContext dbContext)
            : base(widgetService, applicationContext, dbContext)
        {
        }

        public override DbSet<HtmlWidget> CurrentDbSet => (DbContext as CMSDbContext).HtmlWidget;
    }
}
