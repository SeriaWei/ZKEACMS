/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Api;
using ZKEACMS.Product.Models;
using ZKEACMS.Product.Service;

namespace ZKEACMS.Product.ApiControllers
{
    [ApiController]
    [Route("api/productcategory")]
    public class ProductCategoryApiController : ControllerBase
    {
        private readonly IProductCategoryApiService _productCategoryApiService;

        public ProductCategoryApiController(IProductCategoryApiService productCategoryApiService)
        {
            _productCategoryApiService = productCategoryApiService;
        }

        [HttpGet("Get/{id}")]
        public IActionResult Get(int id)
        {
            var productCategory = _productCategoryApiService.Get(id);
            if (productCategory != null) return Ok(productCategory);

            return NotFound();
        }
        [HttpGet("GetByName/{name}")]
        public IActionResult GetByName(string name)
        {
            var productCategory = _productCategoryApiService.GetByName(name);
            if (productCategory != null) return Ok(productCategory);

            return NotFound();
        }
        [HttpPost("Create"), ApiAuthorize(Policy = PermissionKeys.ManageProductCategory)]
        public IActionResult Create([FromBody] ProductCategory productCategory)
        {
            return Ok(_productCategoryApiService.Create(productCategory));
        }

        [HttpPut("Update"), ApiAuthorize(Policy = PermissionKeys.ManageProductCategory)]
        public IActionResult Update([FromBody] ProductCategory productCategory)
        {
            return Ok(_productCategoryApiService.Update(productCategory));
        }

        [HttpDelete("Delete/{id}"), ApiAuthorize(Policy = PermissionKeys.ManageProductCategory)]
        public IActionResult Delete(int id)
        {
            _productCategoryApiService.Delete(id);
            return Ok();
        }
    }
}
