/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */

using ZKEACMS.SectionWidget.Models;
using ZKEACMS.SectionWidget.Service;
using Easy.Constant;
using Easy.Mvc.Authorize;
using Microsoft.AspNetCore.Mvc;

namespace ZKEACMS.SectionWidget.Controllers
{
    [DefaultAuthorize]
    public class SectionContentImageController : Controller
    {
        private readonly ISectionContentProviderService _sectionContentProviderService;

        public SectionContentImageController(ISectionContentProviderService sectionContentProviderService)
        {
            _sectionContentProviderService = sectionContentProviderService;
        }

        public ActionResult Create(string sectionGroupId, string sectionWidgetId)
        {
            return View("Form", new SectionContentImage
            {
                SectionGroupId = sectionGroupId,
                SectionWidgetId = sectionWidgetId,
                ActionType = ActionType.Create
            });
        }
        
        public ActionResult Edit(string Id)
        {
            var content = _sectionContentProviderService.GetContent(Id);
            content.ActionType = ActionType.Update;
            return View("Form", content);
        }
        [HttpPost]
        public ActionResult Save(SectionContentImage content)
        {
            if (!ModelState.IsValid)
            {
                return View("Form", content);
            }
            if (content.ActionType == ActionType.Create)
            {
                _sectionContentProviderService.Add(content);
            }
            else
            {
                _sectionContentProviderService.Update(content);
            }
            ViewBag.Close = true;
            return View("Form", content);
        }

        public JsonResult Delete(string Id)
        {
            _sectionContentProviderService.Remove(Id);
            return Json(true);
        }
    }
}
