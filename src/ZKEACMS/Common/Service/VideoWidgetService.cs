/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Common.Models;
using ZKEACMS.Widget;

namespace ZKEACMS.Common.Service
{
    public class VideoWidgetService : WidgetService<VideoWidget, CMSDbContext>
    {
        public VideoWidgetService(IWidgetBasePartService widgetService, IApplicationContext applicationContext) :
            base(widgetService, applicationContext)
        {
        }

        public override DbSet<VideoWidget> CurrentDbSet
        {
            get
            {
                return DbContext.VideoWidget;
            }
        }
    }
}