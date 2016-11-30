/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */

using Easy.Mvc.Authorize;
using Microsoft.AspNetCore.Mvc;
using ZKEACMS.SectionWidget.Service;


namespace ZKEACMS.SectionWidget.Controllers
{
    [DefaultAuthorize]
    public class SectionWidgetController : Controller
    {
        private readonly ISectionWidgetService _sectionWidgetService;

        public SectionWidgetController(ISectionWidgetService sectionWidgetService)
        {
            _sectionWidgetService = sectionWidgetService;
        }

        public ActionResult Editor(string sectionWidgetId)
        {
            return View(_sectionWidgetService.Get(sectionWidgetId));
        }


    }
}
