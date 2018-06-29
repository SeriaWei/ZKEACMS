using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;
using ZKEACMS.Setting;

namespace ZKEACMS.Controllers
{
    public abstract class SettingController<T> : Controller where T : new()
    {
        private readonly IApplicationSettingService _applicationSettingService;
        public SettingController(IApplicationSettingService applicationSettingService)
        {
            _applicationSettingService = applicationSettingService;
        }
        public virtual string Key { get { return typeof(T).FullName; } }

        public IActionResult Edit()
        {

            return View(_applicationSettingService.Get<T>());
        }

        [HttpPost]
        public IActionResult Edit(T entity)
        {
            if (ModelState.IsValid)
            {
                _applicationSettingService.Save(entity);
                return Redirect("Edit");
            }
            return View(entity);
        }
    }
}
