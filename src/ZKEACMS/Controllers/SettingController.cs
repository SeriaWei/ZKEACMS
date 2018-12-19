/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;
using ZKEACMS.Setting;

namespace ZKEACMS.Controllers
{
    public abstract class SettingController<T> : Controller where T : class, new()
    {
        private readonly IApplicationSettingService _applicationSettingService;
        public SettingController(IApplicationSettingService applicationSettingService)
        {
            _applicationSettingService = applicationSettingService;
        }
        public virtual string Key { get { return typeof(T).FullName; } }

        public virtual IActionResult Config()
        {
            return View("GeneralSetting", _applicationSettingService.Get<T>());
        }

        [HttpPost]
        public virtual IActionResult Config(T entity)
        {
            if (ModelState.IsValid)
            {
                _applicationSettingService.Save(entity);
                return Redirect("Config");
            }
            return View("GeneralSetting", entity);
        }
    }
}
