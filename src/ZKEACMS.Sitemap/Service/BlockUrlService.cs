/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy;
using System;
using System.Collections.Generic;
using System.Text;
using ZKEACMS.Article.Service;
using ZKEACMS.Product.Service;

namespace ZKEACMS.Sitemap.Service
{
    public class BlockUrlService : IBlockUrlService
    {
        private readonly IArticleUrlService _articleUrlService;
        private readonly IProductUrlService _productUrlService;
        public BlockUrlService(IArticleUrlService articleUrlService, IProductUrlService productUrlService)
        {
            _articleUrlService = articleUrlService;
            _productUrlService = productUrlService;
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

            string[] productDetailPages = _productUrlService.GetDetailPages();
            foreach (var item in productDetailPages)
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
