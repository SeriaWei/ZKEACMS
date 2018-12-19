using Easy;
using Easy.Cache;
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using ZKEACMS.Redirection.Models;

namespace ZKEACMS.Redirection.Service
{
    public class UrlRedirectService : ServiceBase<UrlRedirect>, IUrlRedirectService
    {
        private const string CacheKey = "AllUrlRedirectItems";
        private readonly ICacheManager<IEnumerable<UrlRedirect>> _cacheManager;
        public UrlRedirectService(IApplicationContext applicationContext, CMSDbContext dbContext, ICacheManager<IEnumerable<UrlRedirect>> cacheManager) : base(applicationContext, dbContext)
        {
            _cacheManager = cacheManager;
        }
        private void RemoveCache()
        {
            _cacheManager.Remove(CacheKey);
        }
        public override ServiceResult<UrlRedirect> Add(UrlRedirect item)
        {
            ServiceResult<UrlRedirect> result = base.Add(item);
            if (!result.HasViolation)
            {
                RemoveCache();
            }
            return result;
        }
        public override ServiceResult<UrlRedirect> AddRange(params UrlRedirect[] items)
        {
            ServiceResult<UrlRedirect> result = base.AddRange(items);
            if (!result.HasViolation)
            {
                RemoveCache();
            }
            return result;
        }

        public override ServiceResult<UrlRedirect> Update(UrlRedirect item)
        {
            ServiceResult<UrlRedirect> result = base.Update(item);
            if (!result.HasViolation)
            {
                RemoveCache();
            }
            return result;
        }
        public override ServiceResult<UrlRedirect> UpdateRange(params UrlRedirect[] items)
        {
            ServiceResult<UrlRedirect> result = base.UpdateRange(items);
            if (!result.HasViolation)
            {
                RemoveCache();
            }
            return result;
        }

        public override void Remove(UrlRedirect item)
        {
            base.Remove(item);
            RemoveCache();
        }
        public override void Remove(Expression<Func<UrlRedirect, bool>> filter)
        {
            base.Remove(filter);
            RemoveCache();
        }
        public override void RemoveRange(params UrlRedirect[] items)
        {
            base.RemoveRange(items);
            RemoveCache();
        }
        public IEnumerable<UrlRedirect> GetAll()
        {
            return _cacheManager.GetOrAdd(CacheKey, Get().ToList());
        }
    }
}
