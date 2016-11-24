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
    public class WidgetTemplateController : BasicController<WidgetTemplateEntity, long, IWidgetTemplateService>
    {
        private readonly ICookie _cookie;
        public WidgetTemplateController(IWidgetTemplateService widgetTemplateService, ICookie cookie)
            : base(widgetTemplateService)
        {
            _cookie = cookie;
        }

        public ActionResult SelectWidget(QueryContext context)
        {
            var viewModel = new WidgetTemplateViewModel
            {
                PageID = context.PageID,
                LayoutID = context.LayoutID,
                ZoneID = context.ZoneID,
                ReturnUrl = context.ReturnUrl,
                CanPasteWidget = context.ZoneID.IsNotNullAndWhiteSpace() && _cookie.GetValue<string>(Const.CopyWidgetCookie).IsNotNullAndWhiteSpace(),
                WidgetTemplates = Service.GetAll().OrderBy(m => m.Order).ToList()
            };
            return View(viewModel);
        }
        [HttpPost]
        public ActionResult RedirectToWidget(QueryContext context)
        {
            return RedirectToAction("Create", "Widget", new { module = "admin", context.PageID, context.LayoutID, context.ZoneID, context.WidgetTemplateID, context.ReturnUrl });
        }
    }
}
