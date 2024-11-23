/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System.Collections.Generic;
using System.Linq;
using Easy;
using Easy.Extend;
using ZKEACMS.Common.Models;
using ZKEACMS.Widget;
using ZKEACMS.Page;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Extend;

namespace ZKEACMS.Common.Service
{
    public class TabWidgetService : SimpleWidgetService<TabWidget>
    {
        public TabWidgetService(IWidgetBasePartService widgetBasePartService, IApplicationContext applicationContext, CMSDbContext dbContext) :
            base(widgetBasePartService, applicationContext, dbContext)
        {
        }

        public override ErrorOr<TabWidget> Add(TabWidget item)
        {
            item.TabItems = item.TabItems.RemoveDeletedItems().ToList();
            return base.Add(item);
        }
        public override ErrorOr<TabWidget> Update(TabWidget item)
        {
            item.TabItems = item.TabItems.RemoveDeletedItems().ToList();
            return base.Update(item);
        }

        protected override IEnumerable<string> GetFilesInWidget(TabWidget widget)
        {
            return base.GetFilesInWidget(widget);
        }
    }
}