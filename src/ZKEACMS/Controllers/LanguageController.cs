/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.LINQ;
using Easy.Mvc.Attribute;
using Easy.Mvc.Authorize;
using Easy.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc;
using ZKEACMS.Setting;
using System.Linq;
using Easy.RepositoryPattern;
using Easy.Modules.MutiLanguage;
using Easy;
using Easy.Options;
using Microsoft.Extensions.Options;
using System.Collections.Generic;
using System;
using System.Text;
using Easy.Constant;
using Easy.Extend;

namespace ZKEACMS.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.ManageLanguage)]
    public class LanguageController : Controller
    {
        private readonly ILanguageService _languageService;
        private readonly ILocalize _localize;
        IOptions<CultureOption> _cultureOption;
        public LanguageController(ILanguageService languageService, IOptions<CultureOption> cultureOption, ILocalize localize)
        {
            _languageService = languageService;
            _cultureOption = cultureOption;
            _localize = localize;
        }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Edit(string Id)
        {
            string lanKey = Encoding.UTF8.GetString(Convert.FromBase64String(Id));
            var culture = _languageService.GetCultures(lanKey).ToList();
            foreach (var item in _languageService.GetCultureCodes())
            {
                if (culture.Any(m => m.CultureName == item)) continue;

                culture.Add(new LanguageEntity { CultureName = item, LanKey = lanKey });
            }
            return View(culture.OrderBy(m => m.CultureName).ToList());
        }
        [HttpPost]
        public IActionResult Edit(List<LanguageEntity> language, ActionType ActionType, string Id)
        {
            foreach (var item in language)
            {
                if (item.LanValue.IsNullOrWhiteSpace()) continue;

                _languageService.AddOrUpdate(item);
            }
            if (ActionType.HasFlag(ActionType.Exit))
            {
                return RedirectToAction("Index");
            }
            string url = Url.Action("Edit") + "?Id=" + Id;
            return Redirect(url);
        }
        public IActionResult Create()
        {
            List<LanguageEntity> culture = new List<LanguageEntity>();
            foreach (var item in _languageService.GetCultureCodes())
            {
                culture.Add(new LanguageEntity { CultureName = item });
            }
            return View(culture);
        }
        [HttpPost]
        public IActionResult Create(List<LanguageEntity> language, string LanKey, ActionType ActionType)
        {
            if (_languageService.GetCultures(LanKey).Any())
            {
                ViewBag.LanKey = LanKey;
                ModelState.AddModelError("LanKey", _localize.Get("Translation key is already exists"));
                return View(language);
            }
            string id = null;
            foreach (var item in language)
            {
                if (item.LanValue.IsNullOrWhiteSpace()) continue;

                item.LanKey = LanKey;
                _languageService.Add(item);
                if (id == null)
                {
                    id = item.ID;
                }
            }
            if (ActionType.HasFlag(ActionType.Exit) || id.IsNullOrEmpty())
            {
                return RedirectToAction("Index");
            }
            string url = Url.Action("Edit") + "?Id=" + id;
            return Redirect(url);
        }

        [HttpPost]
        public virtual IActionResult GetList(DataTableOption query)
        {
            query.AppendCondition("CultureName", _cultureOption.Value.Code);
            var pagin = new Pagination { PageSize = query.Length, PageIndex = query.Start / query.Length };
            var expression = query.AsExpression<LanguageEntity>();
            var order = query.GetOrderBy<LanguageEntity>();
            if (order != null)
            {
                if (query.IsOrderDescending())
                {
                    pagin.OrderByDescending = order;
                }
                else
                {
                    pagin.OrderBy = order;
                }
            }
            var entities = _languageService.Get(expression, pagin);
            return Json(new TableData(entities, pagin.RecordCount, query.Draw));
        }
        [HttpPost]
        public IActionResult Delete(string id)
        {
            return View();
        }
    }
}
