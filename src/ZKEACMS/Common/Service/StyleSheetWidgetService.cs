/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy;
using Easy.RepositoryPattern;
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
        public override ServiceResult<StyleSheetWidget> Add(StyleSheetWidget item)
        {
            if (item.StyleClass.IsNullOrEmpty())
            {
                item.StyleClass = "full";
            }
            return base.Add(item);
        }
    }
}