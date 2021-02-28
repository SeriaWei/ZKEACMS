/* http://www.zkea.net/ 
 * Copyright 2021 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy;
using Easy.Mvc.Attribute;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc.Rendering;
using ZKEACMS.Article.Service;
using Microsoft.Extensions.DependencyInjection;
using System.Linq;

namespace ZKEACMS.Currency
{
    public class PopulateCurrencyAttribute : Easy.Mvc.Attribute.ViewDataAttribute
    {
        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {

        }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var currencies = filterContext.HttpContext.RequestServices.GetService<ICurrencyService>().Get().ToList();
            foreach (var item in currencies)
            {
                item.Title = item.Title + " - " + item.Code;
            }
            
            (filterContext.Controller as Controller)
                .ViewData[ViewDataKeys.Currency] = new SelectList(currencies, "ID", "Title");
        }
    }
}