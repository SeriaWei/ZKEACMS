/* http://www.zkea.net/ 
 * Copyright 2021 ZKEASOFT 
 * http://www.zkea.net/licenses */


using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Api;
using ZKEACMS.FormGenerator.Service;

namespace ZKEACMS.FormGenerator.ApiControllers
{
    [ApiController]
    [Route("api/formdata")]
    public class FormDataApiController : ControllerBase
    {
        private readonly IFormDataApiService _formDataApiService;

        public FormDataApiController(IFormDataApiService formDataApiService)
        {
            _formDataApiService = formDataApiService;
        }

        [HttpGet("Get/{id}/{top}"), ApiAuthorize(Policy = PermissionKeys.ViewFormData)]
        public IActionResult Get(string id, int top)
        {
            return Ok(_formDataApiService.GetByForm(id, top));
        }
    }
}
