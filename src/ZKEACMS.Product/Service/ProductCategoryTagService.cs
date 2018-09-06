/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using ZKEACMS.Product.Models;
using Easy;
using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;
using System.Linq;

namespace ZKEACMS.Product.Service
{
    public class ProductCategoryTagService : ServiceBase<ProductCategoryTag>, IProductCategoryTagService
    {
        private readonly IProductTagService _productTagService;
        public ProductCategoryTagService(IApplicationContext applicationContext, IProductTagService productTagService, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
            _productTagService = productTagService;
        }

        public override void Remove(ProductCategoryTag item)
        {
            BeginTransaction(() =>
            {
                _productTagService.Remove(m => m.TagId == item.ID);
                if (item.ParentId == 0)
                {
                    var children = LoadChildren(item);
                    var ids = children.Select(m => m.ID).ToArray();
                    _productTagService.Remove(m => ids.Contains(m.TagId));
                    RemoveRange(children.ToArray());
                }
                base.Remove(item);
            });
        }
        private IEnumerable<ProductCategoryTag> LoadChildren(ProductCategoryTag tag)
        {
            List<ProductCategoryTag> result = new List<ProductCategoryTag>();
            var children = Get(m => m.ParentId == tag.ID);
            result.AddRange(children);
            foreach (var item in children)
            {
                result.AddRange(LoadChildren(item));
            }
            return result;
        }
        public override void Remove(Expression<Func<ProductCategoryTag, bool>> filter)
        {
            BeginTransaction(() =>
            {
                var tags = Get(filter);
                foreach (var item in tags)
                {
                    var children = LoadChildren(item);
                    var ids = children.Select(m => m.ID).ToArray();
                    _productTagService.Remove(m => ids.Contains(m.TagId));
                }
                RemoveRange(tags.ToArray());
            });
        }
    }
}
