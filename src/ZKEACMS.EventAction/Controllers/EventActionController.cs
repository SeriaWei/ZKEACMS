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
using System.IO;
using System.Text;

namespace ZKEACMS.EventAction.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.ViewEventAction)]
    public class EventActionController : BasicController<Models.EventAction, int, IEventActionService>
    {
        public EventActionController(IEventActionService service) : base(service)
        {
        }

        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageEventAction)]
        public override IActionResult Edit(Models.EventAction entity)
        {
            return base.Edit(entity);
        }

        [DefaultAuthorize(Policy = PermissionKeys.ManageEventAction)]
        public override IActionResult Create()
        {
            return View(new Models.EventAction
            {
                Actions = System.IO.File.ReadAllText(Path.Combine(PluginBase.GetPath<EventActionPlug>(), "example.yml"), Encoding.UTF8)
            });
        }

        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageEventAction)]
        public override IActionResult Create(Models.EventAction entity)
        {
            return base.Create(entity);
        }

        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageEventAction)]
        public override IActionResult Delete(int id)
        {
            return base.Delete(id);
        }
    }
}
