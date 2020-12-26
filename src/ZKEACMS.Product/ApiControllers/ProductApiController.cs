/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Product.Service;
using ZKEACMS.Api;
using ZKEACMS.Product.Models;

namespace ZKEACMS.Product.ApiControllers
{
    [ApiController]
    [Route("api/product")]
    public class ProductApiController : ControllerBase
    {
        private readonly IProductApiService _productApiService;

        public ProductApiController(IProductApiService productApiService)
        {
            _productApiService = productApiService;
        }
        [HttpGet("Get/{id}")]
        public IActionResult Get(int id)
        {
            var product = _productApiService.Get(id);
            if (product != null) return Ok(product);

            return NotFound();
        }
        [HttpGet("GetByName/{name}")]
        public IActionResult GetByName(string name)
        {
            var product = _productApiService.GetByName(name);
            if (product != null) return Ok(product);

            return NotFound();
        }
        [HttpPost("Create"), ApiAuthorize(Policy = PermissionKeys.ManageProduct)]
        public IActionResult Create([FromBody] ProductEntity product)
        {
            return Ok(_productApiService.Create(product));
        }

        [HttpPut("Update"), ApiAuthorize(Policy = PermissionKeys.ManageProduct)]
        public IActionResult Update([FromBody] ProductEntity product)
        {
            return Ok(_productApiService.Update(product));
        }

        [HttpPut("Publish"), ApiAuthorize(Policy = PermissionKeys.PublishProduct)]
        public IActionResult Publish(int id)
        {
            var product = _productApiService.Publish(id);
            if (product != null) return Ok(product);

            return NotFound();
        }
        [HttpDelete("Delete/{id}"), ApiAuthorize(Policy = PermissionKeys.ManageProduct)]
        public IActionResult Delete(int id)
        {
            _productApiService.Delete(id);
            return Ok();
        }
    }
}
