/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Extend;
using Easy.Mvc.Attribute;
using ZKEACMS.Zone;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc.Rendering;
using Easy;
using Microsoft.Extensions.DependencyInjection;
using System.Collections.Generic;
using ZKEACMS.Page;

namespace ZKEACMS.Widget
{
    public class ViewDataZonesAttribute : Easy.Mvc.Attribute.ViewDataAttribute
    {
        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            ViewResult result = filterContext.Result as ViewResult;
            if (result != null)
            {
                if (result.Model is WidgetBase)
                {
                    WidgetBase widget = result.Model as WidgetBase;
                    var zoneService = filterContext.HttpContext.RequestServices.GetService<IZoneService>();
                    if (!widget.PageId.IsNullOrEmpty())
                    {
                        var pageService = filterContext.HttpContext.RequestServices.GetService<IPageService>();
                        (filterContext.Controller as Controller).ViewData[ViewDataKeys.Zones] = new SelectList(zoneService.GetByPage(pageService.Get(widget.PageId)), "HeadingCode", "ZoneName");
                    }
                    else if (!widget.LayoutId.IsNullOrEmpty())
                    {
                        (filterContext.Controller as Controller).ViewData[ViewDataKeys.Zones] = new SelectList(zoneService.GetByLayoutId(widget.LayoutId), "HeadingCode", "ZoneName");
                    }
                    else
                    {
                        var localize = filterContext.HttpContext.RequestServices.GetService<ILocalize>();
                        (filterContext.Controller as Controller).ViewData[ViewDataKeys.Zones] = new SelectList(new List<ZoneEntity> { new ZoneEntity { HeadingCode = "ZONE-X", ZoneName = localize.Get("Dynamic") } }, "HeadingCode", "ZoneName");
                    }
                }
            }
        }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
        }
    }
}
