/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy;
using Easy.RepositoryPattern;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.FormGenerator.Models;

namespace ZKEACMS.FormGenerator.Service
{
    public interface IFormDataService : IService<FormData>
    {
        ErrorOr<FormData> SaveForm(IFormCollection form, string formId);
        MemoryStream Export(int id);
        MemoryStream ExportByForm(string formId);
    }
}
