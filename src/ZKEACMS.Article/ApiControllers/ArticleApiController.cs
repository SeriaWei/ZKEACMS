/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Article.Service;
using ZKEACMS.Api;
using ZKEACMS.Article.Models;

namespace ZKEACMS.Article.ApiControllers
{
    [ApiController]
    [Route("api/article")]
    public class ArticleApiController : ControllerBase
    {
        private readonly IArticleApiService _articleService;

        public ArticleApiController(IArticleApiService articleService)
        {
            _articleService = articleService;
        }
        [HttpGet("Get/{id}")]
        public IActionResult Get(int id)
        {
            var article = _articleService.Get(id);
            if (article != null) return Ok(article);

            return NotFound();
        }
        [HttpGet("GetByName/{name}")]
        public IActionResult GetByName(string name)
        {
            var article = _articleService.GetByName(name);
            if (article != null) return Ok(article);

            return NotFound();
        }
        [HttpPost("Create"), ApiAuthorize(Policy = PermissionKeys.ManageArticle)]
        public IActionResult Create([FromBody] ArticleEntity article)
        {
            return Ok(_articleService.Create(article));
        }

        [HttpPut("Update"), ApiAuthorize(Policy = PermissionKeys.ManageArticle)]
        public IActionResult Update([FromBody] ArticleEntity article)
        {
            return Ok(_articleService.Update(article));
        }

        [HttpPut("Publish"), ApiAuthorize(Policy = PermissionKeys.PublishArticle)]
        public IActionResult Publish(int id)
        {
            var article = _articleService.Publish(id);
            if (article != null) return Ok(article);

            return NotFound();
        }
        [HttpDelete("Delete/{id}"), ApiAuthorize(Policy = PermissionKeys.ManageArticle)]
        public IActionResult Delete(int id)
        {
            _articleService.Delete(id);
            return Ok();
        }
    }
}
