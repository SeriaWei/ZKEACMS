/* http://www.zkea.net/ 
 * Copyright 2016 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.FormGenerator.Models;
using ZKEACMS.FormGenerator.Service;
using Easy.Extend;
using Easy.Mvc.Authorize;
using Microsoft.AspNetCore.Authorization;
using System.Net;
using Microsoft.AspNetCore.WebUtilities;
using Microsoft.Extensions.Primitives;

namespace ZKEACMS.FormGenerator.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.ViewFormData)]
    public class FormDataController : BasicController<FormData, int, IFormDataService>
    {
        private const string ExcelContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";

        public FormDataController(IFormDataService service) : base(service)
        {
        }
        [HttpPost, AllowAnonymous]
        public IActionResult Submit(string next, string FormId)
        {
            var pathArray = next.Split("?");

            Dictionary<string, StringValues> queryDic = null;
            if (pathArray.Length > 1)
            {
                queryDic= QueryHelpers.ParseQuery(pathArray[1]);
            }
            else
            {
                queryDic = new Dictionary<string, StringValues>();
            }            
            queryDic.Remove("status");
            queryDic.Remove("msg");
            var result = Service.SaveForm(Request.Form, FormId);
            if (result.HasViolation)
            {
                queryDic.Add("status", "error");
                queryDic.Add("msg", WebUtility.UrlEncode(result.ErrorMessage));
            }
            else
            {
                queryDic.Add("status", "complete");
            }
            return Redirect(QueryHelpers.AddQueryString(pathArray[0], queryDic.ToDictionary(m => m.Key, m => m.Value.ToString())));
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageFormData)]
        public override IActionResult Delete(int id)
        {
            return base.Delete(id);
        }
        [DefaultAuthorize(Policy = PermissionKeys.ExportFormData)]
        public IActionResult Export(int id)
        {
            return File(Service.Export(id), ExcelContentType);
        }
        [DefaultAuthorize(Policy = PermissionKeys.ExportFormData)]
        public IActionResult ExportForm(string id)
        {
            return File(Service.ExportByForm(id), ExcelContentType);
        }
    }
}
