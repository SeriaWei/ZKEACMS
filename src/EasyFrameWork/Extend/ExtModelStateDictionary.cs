/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Microsoft.AspNetCore.Mvc.ModelBinding;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace Easy.Extend
{
    public static class ExtModelStateDictionary
    {
        public static string CombineErrorMessage(this ModelStateDictionary modelState)
        {
            return string.Join(";", modelState.Values.Where(m => m.Errors.Count > 0).SelectMany(m => m.Errors.Select(e => e.ErrorMessage)));
        }
    }
}
