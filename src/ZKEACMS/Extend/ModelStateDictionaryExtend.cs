/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS
{
    public static class ModelStateDictionaryExtend
    {
        public static void Merge<T>(this ModelStateDictionary modelState, ServiceResult<T> serviceResult)
        {
            foreach (var item in serviceResult.RuleViolations)
            {
                modelState.AddModelError(item.ParameterName, item.ErrorMessage);
            }
        }
    }
}
