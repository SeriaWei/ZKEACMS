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

namespace ZKEACMS.Product.Service
{
    public class ProductBlockUrlService : IBlockUrlService
    {
        private readonly IProductUrlService _productUrlService;
        public ProductBlockUrlService(IProductUrlService productUrlService)
        {
            _productUrlService = productUrlService;
        }

        public HashSet<string> GetAll()
        {
            HashSet<string> result = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
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
