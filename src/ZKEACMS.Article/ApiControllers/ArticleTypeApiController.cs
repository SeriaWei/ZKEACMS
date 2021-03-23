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
using ZKEACMS.Article.Models;
using ZKEACMS.Article.Service;

namespace ZKEACMS.Article.ApiControllers
{
    [ApiController]
    [Route("api/articletype")]
    public class ArticleTypeApiController : ControllerBase
    {
        private readonly IArticleTypeApiService _articleTypeApiService;

        public ArticleTypeApiController(IArticleTypeApiService articleTypeApiService)
        {
            _articleTypeApiService = articleTypeApiService;
        }

        [HttpGet("Get/{id}")]
        public IActionResult Get(int id)
        {
            var articleType = _articleTypeApiService.Get(id);
            if (articleType != null) return Ok(articleType);

            return NotFound();
        }
        [HttpGet("GetByName/{name}")]
        public IActionResult GetByName(string name)
        {
            var articleType = _articleTypeApiService.GetByName(name);
            if (articleType != null) return Ok(articleType);

            return NotFound();
        }
        [HttpPost("Create"), ApiAuthorize(Policy = PermissionKeys.ManageArticleType)]
        public IActionResult Create([FromBody] ArticleType articleType)
        {
            return Ok(_articleTypeApiService.Create(articleType));
        }

        [HttpPut("Update"), ApiAuthorize(Policy = PermissionKeys.ManageArticleType)]
        public IActionResult Update([FromBody] ArticleType articleType)
        {
            return Ok(_articleTypeApiService.Update(articleType));
        }

        [HttpDelete("Delete/{id}"), ApiAuthorize(Policy = PermissionKeys.ManageArticleType)]
        public IActionResult Delete(int id)
        {
            _articleTypeApiService.Delete(id);
            return Ok();
        }
    }
}
