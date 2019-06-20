/* http://www.zkea.net/ 
 * Copyright 2016 ZKEASOFT 
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

namespace ZKEACMS.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.ManageLanguage)]
    public class LanguageController : Controller
    {
        private readonly ILanguageService _languageService;
        private readonly IOptions<CultureOption> _cultureOption;
        private readonly ILocalize _localize;

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

            return View(culture);
        }
        [HttpPost]
        public IActionResult Edit(List<LanguageEntity> language)
        {
            foreach (var item in language)
            {
                _languageService.AddOrUpdate(item);
            }
            return RedirectToAction("Index");
        }
        public IActionResult Create()
        {
            List<LanguageEntity> culture = new List<LanguageEntity>
            {
                new LanguageEntity { CultureName = _cultureOption.Value.Code }
            };

            return View(culture);
        }
        [HttpPost]
        public IActionResult Create(List<LanguageEntity> language, string LanKey)
        {
            if (_languageService.GetCultures(LanKey).Any())
            {
                ViewBag.LanKey = LanKey;
                ModelState.AddModelError("LanKey", _localize.Get("翻译键已存在"));
                return View(language);
            }
            foreach (var item in language)
            {
                item.LanKey = LanKey;
                _languageService.Add(item);
            }
            return RedirectToAction("Index");
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
