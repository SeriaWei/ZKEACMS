/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.FormGenerator.Models;

namespace ZKEACMS.FormGenerator.Service
{
    public interface IFormDataApiService
    {
        IEnumerable<FormDataApiModel> GetByForm(string formId, int top);
    }
}
