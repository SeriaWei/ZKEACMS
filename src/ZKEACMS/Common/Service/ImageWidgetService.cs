/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Common.Models;
using ZKEACMS.Widget;

namespace ZKEACMS.Common.Service
{
    public class ImageWidgetService : WidgetService<ImageWidget,CMSDbContext>
    {
        public ImageWidgetService(IWidgetBasePartService widgetService, IApplicationContext applicationContext)
            : base(widgetService, applicationContext)
        {
        }

        public override DbSet<ImageWidget> CurrentDbSet
        {
            get
            {
                return DbContext.ImageWidget;
            }
        }
    }
}