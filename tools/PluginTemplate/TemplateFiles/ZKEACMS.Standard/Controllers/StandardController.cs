/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
 
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Easy.Mvc.Controllers;
using ZKEACMS.Standard.Service;
using Easy.Mvc.Authorize;
using ZKEACMS.Standard.Models;

namespace ZKEACMS.Standard.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.ViewStandard)]
    public class StandardController : BasicController<Models.Standard, int, IStandardService>
    {
        public StandardController(IStandardService service) : base(service)
        {
        }

        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageStandard)]
        public override IActionResult Edit(Models.Standard entity)
        {
            return base.Edit(entity);
        }

        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageStandard)]
        public override IActionResult Create(Models.Standard entity)
        {
            return base.Create(entity);
        }

        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageStandard)]
        public override IActionResult Delete(int id)
        {
            return base.Delete(id);
        }
    }
}
