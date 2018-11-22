/* http://www.zkea.net/ 
 * Copyright 2016 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy.LINQ;
using Easy.Mvc.Attribute;
using Easy.Mvc.Authorize;
using Easy.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc;
using ZKEACMS.Setting;
using System.Linq;
using Easy.RepositoryPattern;
using ZKEACMS.Rule;
using ZKEACMS.Widget;

namespace ZKEACMS.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.ViewPage)]
    public class RuleController : BasicController<Rule.Rule, int, IRuleService>
    {
        private readonly IWidgetBasePartService _widgetBasePartService;
        public RuleController(IRuleService service, IWidgetBasePartService widgetBasePartService)
            : base(service)
        {
            _widgetBasePartService = widgetBasePartService;
        }
        public override IActionResult Index()
        {
            if (TempData.ContainsKey("RuleId"))
            {
                ViewBag.RuleID = "rule-" + TempData["RuleId"];
            }
            return View(Service.Get().ToList());
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManagePage)]
        public override IActionResult Create()
        {
            return base.Create();
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManagePage)]
        public override IActionResult Create(Rule.Rule entity)
        {
            var result = base.Create(entity);
            if (entity.RuleID > 0)
            {
                TempData.Add("RuleId", entity.RuleID);
            }
            return result;
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManagePage)]
        public override IActionResult Edit(int Id)
        {
            return base.Edit(Id);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManagePage)]
        public override IActionResult Edit(Rule.Rule entity)
        {
            TempData.Add("RuleId", entity.RuleID);
            return base.Edit(entity);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManagePage)]
        public override IActionResult Delete(int id)
        {
            return base.Delete(id);
        }
        [HttpPost]
        public IActionResult RuleWidgets(int Id)
        {
            ViewBag.RuleID = Id;
            return PartialView("RuleWidgets", _widgetBasePartService.Get(m => m.RuleID == Id));
        }
    }
}
