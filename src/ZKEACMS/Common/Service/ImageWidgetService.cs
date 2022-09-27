/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
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

        protected override IEnumerable<string> GetImagesInWidget(ImageWidget widget)
        {
            yield return widget.ImageUrl;
            yield return widget.ImageUrlMd;
            yield return widget.ImageUrlSm;
        }
    }
}