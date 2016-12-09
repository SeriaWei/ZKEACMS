/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */

using ZKEACMS.SectionWidget.Models;
using ZKEACMS.SectionWidget.Service;
using Easy.Constant;
using Microsoft.AspNetCore.Mvc;
using Easy.Mvc.Authorize;

namespace ZKEACMS.SectionWidget.Controllers
{
    public class SectionContentVideoController : Controller
    {
        private readonly ISectionContentProviderService _sectionContentProviderService;

        public SectionContentVideoController(ISectionContentProviderService sectionContentProviderService)
        {
            _sectionContentProviderService = sectionContentProviderService;
        }
        [DefaultAuthorize]
        public ActionResult Create(string sectionGroupId, string sectionWidgetId)
        {
            return View("Form", new SectionContentVideo
            {
                SectionGroupId = sectionGroupId,
                SectionWidgetId = sectionWidgetId,
                ActionType = ActionType.Create
            });
        }
        [DefaultAuthorize]
        public ActionResult Edit(string Id)
        {
            var content = _sectionContentProviderService.GetContent(Id);
            content.ActionType = ActionType.Update;
            return View("Form", content);
        }
        [HttpPost, DefaultAuthorize]
        public ActionResult Save(SectionContentVideo content)
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
        [DefaultAuthorize]
        public JsonResult Delete(string Id)
        {
            _sectionContentProviderService.Remove(Id);
            return Json(true);
        }

        public ActionResult Play(string Id)
        {
            return View(_sectionContentProviderService.Get(Id));
        }
    }
}
