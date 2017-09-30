using Easy.RepositoryPattern;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.FormGenerator.Models;

namespace ZKEACMS.FormGenerator.Service
{
    public interface IFormDataService : IService<FormData>
    {
        void SaveForm(IFormCollection form, string formId);
    }
}
