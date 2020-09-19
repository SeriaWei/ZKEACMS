/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy;
using Easy.Extend;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Common.Models;
using ZKEACMS.Widget;

namespace ZKEACMS.Common.Service
{
    public class VideoWidgetService : WidgetService<VideoWidget>
    {
        public VideoWidgetService(IWidgetBasePartService widgetService, IApplicationContext applicationContext, CMSDbContext dbContext)
            : base(widgetService, applicationContext, dbContext)
        {
        }
        public override DbSet<VideoWidget> CurrentDbSet => DbContext.VideoWidget;

        public override WidgetViewModelPart Display(WidgetBase widget, ActionContext actionContext)
        {
            VideoWidget videoWidget = widget as VideoWidget;
            if (!videoWidget.Height.HasValue)
            {
                videoWidget.Height = 400;
            }

            if (videoWidget.Code.IsNotNullAndWhiteSpace() &&
                videoWidget.Code.StartsWith("<iframe ", StringComparison.OrdinalIgnoreCase) &&
                videoWidget.Code.IndexOf("style", StringComparison.OrdinalIgnoreCase) < 0)
            {
                videoWidget.Code = "<iframe style=\"width:100%;height:100%\" " + videoWidget.Code.Substring(8);
            }
            return base.Display(widget, actionContext);
        }
    }
}