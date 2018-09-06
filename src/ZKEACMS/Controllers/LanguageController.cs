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

namespace ZKEACMS.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.ManageLanguage)]
    public class LanguageController : Controller
    {
        public readonly ILanguageService _languageService;
        public readonly IOptions<CultureOption> _cultureOption;
        public LanguageController(ILanguageService languageService, IOptions<CultureOption> cultureOption)
        {
            _languageService = languageService;
            _cultureOption = cultureOption;
        }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Edit(string Id)
        {
            return View(_languageService.Get(Id, _cultureOption.Value.Code));
        }
        [HttpPost]
        public IActionResult Edit(LanguageEntity language)
        {
            if (ModelState.IsValid)
            {
                _languageService.Update(language);
                return RedirectToAction("Index");
            }
            return View(language);
        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Create(LanguageEntity language)
        {
            if (ModelState.IsValid)
            {
                _languageService.Add(language);
                return RedirectToAction("Index");
            }
            return View(language);
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
