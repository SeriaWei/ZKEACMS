/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using Easy;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Common.Models;
using ZKEACMS.Widget;

namespace ZKEACMS.Common.Service
{
    public class ImageWidgetService : WidgetService<ImageWidget>
    {
        public ImageWidgetService(IWidgetBasePartService widgetService, IApplicationContext applicationContext, CMSDbContext dbContext)
            : base(widgetService, applicationContext, dbContext)
        {
        }

        public override DbSet<ImageWidget> CurrentDbSet => DbContext.ImageWidget;

        public override WidgetPackage PackWidget(WidgetBase widget)
        {
            var package = base.PackWidget(widget);
            AddFileToPackage(package, (widget as ImageWidget).ImageUrl);
            AddFileToPackage(package, (widget as ImageWidget).ImageUrlMd);
            AddFileToPackage(package, (widget as ImageWidget).ImageUrlSm);
            return package;
        }
    }
}