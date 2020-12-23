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

namespace ZKEACMS.Article.ApiControllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ArticleController : ControllerBase
    {
        private readonly IArticleService _articleService;

        public ArticleController(IArticleService articleService)
        {
            _articleService = articleService;
        }
        [HttpGet("Get/{id}"), ApiAuthorize(Policy = PermissionKeys.ViewArticle)]
        public IActionResult Get(int id)
        {
            var article = _articleService.Get(id);
            if (article != null) return Ok(article);

            return NotFound();
        }
    }
}
