/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using Easy;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Common.Models;
using ZKEACMS.Widget;
using Easy.Extend;

namespace ZKEACMS.Common.Service
{
    public class StyleSheetWidgetService : WidgetService<StyleSheetWidget>
    {
        public StyleSheetWidgetService(IWidgetBasePartService widgetService, IApplicationContext applicationContext, CMSDbContext dbContext)
            : base(widgetService, applicationContext, dbContext)
        {
        }
        public override DbSet<StyleSheetWidget> CurrentDbSet => DbContext.StyleSheetWidget;
        public override ErrorOr<StyleSheetWidget> Add(StyleSheetWidget item)
        {
            if (item.StyleClass.IsNullOrEmpty())
            {
                item.StyleClass = "full";
            }
            return base.Add(item);
        }
    }
}