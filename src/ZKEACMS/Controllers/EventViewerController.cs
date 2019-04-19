/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using Easy.Mvc.Authorize;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Text;
using ZKEACMS.Common.Service;

namespace ZKEACMS.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.ManageEventViewer)]
    public class EventViewerController : Controller
    {
        private readonly IEventViewerService _eventViewerService;
        public EventViewerController(IEventViewerService eventViewerService)
        {
            _eventViewerService = eventViewerService;
        }
        public IActionResult Index()
        {
            return View(_eventViewerService.Get());
        }
        public IActionResult Delete(string id)
        {
            _eventViewerService.Delete(id);
            return Json(true);
        }
        public IActionResult ViewLog(string id)
        {
            return Content(_eventViewerService.ReadLog(id));
        }
    }
}
