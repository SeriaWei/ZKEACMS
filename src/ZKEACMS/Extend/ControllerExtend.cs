/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Extend
{
    public static class ControllerExtend
    {
        public static IActionResult NotFoundResult(this Controller controller)
        {
            var viewResult = controller.View();
            viewResult.StatusCode = 404;
            viewResult.ViewName = "NotFound";
            return viewResult;
        }
    }
}
