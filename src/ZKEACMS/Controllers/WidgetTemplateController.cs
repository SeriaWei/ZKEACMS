/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Linq;
using Easy.Extend;
using Easy.Mvc.Attribute;
using Easy.Mvc.Authorize;
using Easy.Mvc.Controllers;
using ZKEACMS.WidgetTemplate;
using Easy.Mvc.ValueProvider;
using Microsoft.AspNetCore.Mvc;

namespace ZKEACMS.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.ManagePage)]
    public class WidgetTemplateController : Controller
    {
        private readonly ICookie _cookie;
        private readonly IWidgetTemplateService _widgetTemplateService;
        public WidgetTemplateController(IWidgetTemplateService widgetTemplateService, ICookie cookie)
        {
            _cookie = cookie;
            _widgetTemplateService = widgetTemplateService;
        }

        public ActionResult SelectWidget(QueryContext context)
        {
            var viewModel = new WidgetTemplateViewModel
            {
                PageID = context.PageID,
                LayoutID = context.LayoutID,
                ZoneID = context.ZoneID,
                RuleID = context.RuleID,
                ReturnUrl = context.ReturnUrl,
                CanPasteWidget = context.ZoneID.IsNotNullAndWhiteSpace() && _cookie.GetValue<string>(Const.CopyWidgetCookie).IsNotNullAndWhiteSpace(),
                WidgetTemplates = _widgetTemplateService.Get().OrderBy(m => m.Order).ToList()
            };
            return View(viewModel);
        }
        [HttpPost]
        public ActionResult RedirectToWidget(QueryContext context)
        {
            return RedirectToAction("Create", "Widget", new { context.PageID, context.LayoutID, context.ZoneID,context.RuleID, context.WidgetTemplateID, context.ReturnUrl });
        }
    }
}
