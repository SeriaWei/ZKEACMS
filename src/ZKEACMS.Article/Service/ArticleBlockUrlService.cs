/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy;
using System;
using System.Collections.Generic;
using System.Text;
using ZKEACMS.Article.Service;
using ZKEACMS.Product.Service;
using ZKEACMS.Sitemap.Service;

namespace ZKEACMS.Article.Service
{
    public class ArticleBlockUrlService : IBlockUrlService
    {
        private readonly IArticleUrlService _articleUrlService;
        public ArticleBlockUrlService(IArticleUrlService articleUrlService)
        {
            _articleUrlService = articleUrlService;
        }

        public HashSet<string> GetAll()
        {
            HashSet<string> result = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
            string[] articleDetailPages = _articleUrlService.GetDetailPages();
            foreach (var item in articleDetailPages)
            {
                string url = Helper.Url.ToAbsolutePath(item);
                if (!result.Contains(url))
                {
                    result.Add(url);
                }
            }
            return result;
        }
    }
}
