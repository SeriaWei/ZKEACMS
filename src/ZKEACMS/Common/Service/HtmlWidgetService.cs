/* http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Common.Models;
using ZKEACMS.Widget;

namespace ZKEACMS.Common.Service
{
    public class HtmlWidgetService : WidgetService<HtmlWidget, CMSDbContext>
    {
        public HtmlWidgetService(IWidgetBasePartService widgetService, IApplicationContext applicationContext)
            : base(widgetService, applicationContext)
        {
        }

        public override DbSet<HtmlWidget> CurrentDbSet
        {
            get
            {
                return DbContext.HtmlWidget;
            }
        }
    }
}
