/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
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
                    if (!widget.PageID.IsNullOrEmpty())
                    {
                        var pageService = filterContext.HttpContext.RequestServices.GetService<IPageService>();
                        (filterContext.Controller as Controller).ViewData[ViewDataKeys.Zones] = new SelectList(zoneService.GetByPage(pageService.Get(widget.PageID)), "HeadingCode", "ZoneName");
                    }
                    else if (!widget.LayoutID.IsNullOrEmpty())
                    {
                        (filterContext.Controller as Controller).ViewData[ViewDataKeys.Zones] = new SelectList(zoneService.GetByLayoutId(widget.LayoutID), "HeadingCode", "ZoneName");
                    }
                    else
                    {
                        var localize = filterContext.HttpContext.RequestServices.GetService<ILocalize>();
                        (filterContext.Controller as Controller).ViewData[ViewDataKeys.Zones] = new SelectList(new List<ZoneEntity> { new ZoneEntity { HeadingCode = "ZONE-X", ZoneName = localize.Get("动态") } }, "HeadingCode", "ZoneName");
                    }
                }
            }
        }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
        }
    }
}
