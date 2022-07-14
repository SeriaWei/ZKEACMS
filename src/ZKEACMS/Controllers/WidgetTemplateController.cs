/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System.Linq;
using Easy.Extend;
using Easy.Mvc.Attribute;
using Easy.Mvc.Authorize;
using Easy.Mvc.Controllers;
using ZKEACMS.WidgetTemplate;
using Easy.Mvc.ValueProvider;
using Microsoft.AspNetCore.Mvc;
using ZKEACMS.Widget;

namespace ZKEACMS.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.ManagePage)]
    public class WidgetTemplateController : Controller
    {
        private readonly ICookie _cookie;
        private readonly IWidgetTemplateService _widgetTemplateService;
        private readonly IWidgetBasePartService _widgetBasePartService;
        public WidgetTemplateController(IWidgetTemplateService widgetTemplateService, ICookie cookie, IWidgetBasePartService widgetBasePartService)
        {
            _cookie = cookie;
            _widgetTemplateService = widgetTemplateService;
            _widgetBasePartService = widgetBasePartService;
        }

        public ActionResult SelectWidget(QueryContext context)
        {
            var viewModel = new WidgetTemplateViewModel
            {
                PageId = context.PageId,
                LayoutId = context.LayoutId,
                ZoneId = context.ZoneId,
                RuleID = context.RuleID,
                ReturnUrl = context.ReturnUrl,
                CanPasteWidget = context.ZoneId.IsNotNullAndWhiteSpace() && _cookie.GetValue<string>(Const.CopyWidgetCookie).IsNotNullAndWhiteSpace(),
                WidgetTemplates = _widgetTemplateService.Get().OrderBy(m => m.Order).ToList(),
                PredefinedTemplates = _widgetBasePartService.Get(m => m.IsTemplate == true).ToList()
            };
            return View(viewModel);
        }
        [HttpPost]
        public ActionResult RedirectToWidget(QueryContext context)
        {
            return RedirectToAction("Create", "Widget", new
            {
                context.PageId,
                context.LayoutId,
                context.ZoneId,
                context.RuleID,
                context.WidgetTemplateID,
                context.WidgetID,
                context.ReturnUrl
            });
        }
    }
}
