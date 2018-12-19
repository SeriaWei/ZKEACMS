using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.FormGenerator.Models;

namespace ZKEACMS.FormGenerator.Service.Validator
{
    public interface IFormDataValidator
    {
        bool Validate(FormField field, FormDataItem data, out string message);
    }
}
