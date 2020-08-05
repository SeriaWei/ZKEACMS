using Easy;
using Easy.Cache;
using Easy.Constant;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using ZKEACMS.Redirection.Models;

namespace ZKEACMS.Redirection.Service
{
    public class UrlRedirectService : ServiceBase<UrlRedirect, CMSDbContext>, IUrlRedirectService
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
        private ServiceResult<UrlRedirect> ParsePattern(UrlRedirect item)
        {
            ServiceResult<UrlRedirect> exceptionResult = new ServiceResult<UrlRedirect>();
            if (item.IsPattern ?? false)
            {
                try
                {
                    item.ParsePattern();
                }
                catch (Exception ex)
                {
                    exceptionResult.AddRuleViolation("InComingUrl", ex.Message);

                }
            }
            return exceptionResult;
        }
        private ServiceResult<UrlRedirect> Test(UrlRedirect item)
        {
            ServiceResult<UrlRedirect> result = new ServiceResult<UrlRedirect>();
            HashSet<string> direction = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
            direction.Add(item.InComingUrl);
            direction.Add(item.DestinationURL);
            UrlRedirect destiantion = item;
            while (true)
            {
                destiantion = GetAll().FirstOrDefault(m => m.ID != item.ID && m.IsMatch(destiantion.DestinationURL));
                if (destiantion == null)
                {
                    break;
                }

            }
            return result;
        }
        public override IQueryable<UrlRedirect> Get()
        {
            return CurrentDbSet.AsNoTracking();
        }
        public override ServiceResult<UrlRedirect> Add(UrlRedirect item)
        {
            ServiceResult<UrlRedirect> parseResult = ParsePattern(item);
            if (parseResult.HasViolation)
            {
                return parseResult;
            }
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
            ServiceResult<UrlRedirect> parseResult = ParsePattern(item);
            if (parseResult.HasViolation)
            {
                return parseResult;
            }
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
            return _cacheManager.GetOrAdd(CacheKey, key => Get(m => m.Status == (int)RecordStatus.Active).ToList());
        }

        public UrlRedirect GetByPath(string path)
        {
            return GetAll().FirstOrDefault(m => m.IsMatch(path));
        }
    }
}
