/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
 
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Easy.Mvc.Controllers;
using ZKEACMS.EventAction.Service;
using Easy.Mvc.Authorize;
using ZKEACMS.EventAction.Models;

namespace ZKEACMS.EventAction.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.ViewActionBody)]
    public class ActionBodyController : BasicController<Models.ActionBody, int, IActionBodyService>
    {
        public ActionBodyController(IActionBodyService service) : base(service)
        {
        }

        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageActionBody)]
        public override IActionResult Edit(Models.ActionBody entity)
        {
            return base.Edit(entity);
        }

        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageActionBody)]
        public override IActionResult Create(Models.ActionBody entity)
        {
            return base.Create(entity);
        }

        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageActionBody)]
        public override IActionResult Delete(int id)
        {
            return base.Delete(id);
        }
    }
}
