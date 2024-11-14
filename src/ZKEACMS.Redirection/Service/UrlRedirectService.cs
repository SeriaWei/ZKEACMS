/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

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
        private readonly ICacheManager<UrlRedirectService> _cacheManager;
        public UrlRedirectService(IApplicationContext applicationContext, CMSDbContext dbContext, ICacheManager<UrlRedirectService> cacheManager) : base(applicationContext, dbContext)
        {
            _cacheManager = cacheManager;
        }
        private void RemoveCache()
        {
            _cacheManager.Remove(CacheKey);
        }
        private ErrorOr<UrlRedirect> PatternTest(UrlRedirect item)
        {
            ErrorOr<UrlRedirect> exceptionResult = new ErrorOr<UrlRedirect>();
            if (item.IsPattern ?? false)
            {
                try
                {
                    item.ParsePattern();
                }
                catch (Exception ex)
                {
                    exceptionResult.AddError("InComingUrl", ex.Message);

                }
            }
            return exceptionResult;
        }
        private ErrorOr<UrlRedirect> LoopTest(UrlRedirect item)
        {
            ErrorOr<UrlRedirect> result = new ErrorOr<UrlRedirect>();
            List<string> direction = new List<string>();
            direction.Add(item.DestinationURL.ToLowerInvariant());
            UrlRedirect destiantion = item;
            List<UrlRedirect> allRedirects = GetAll().Where(m => m.ID != item.ID).ToList();
            allRedirects.Add(item);
            while (true)
            {
                destiantion = allRedirects.FirstOrDefault(m => m.IsMatch(destiantion.DestinationURL));
                if (destiantion == null)
                {
                    break;
                }
                else
                {
                    string url = destiantion.DestinationURL.ToLowerInvariant();
                    if (direction.Contains(url))
                    {
                        direction.Add(url);
                        result.AddError("DestinationURL", string.Join(" > ", direction));
                        break;
                    }
                    else
                    {
                        direction.Add(url);
                    }
                }
            }
            return result;
        }
        private ErrorOr<UrlRedirect> Valid(UrlRedirect item)
        {
            ErrorOr<UrlRedirect> result = PatternTest(item);
            if (result.HasError)
            {
                return result;
            }
            return LoopTest(item);
        }
        public override IQueryable<UrlRedirect> Get()
        {
            return CurrentDbSet.AsNoTracking();
        }
        public override ErrorOr<UrlRedirect> Add(UrlRedirect item)
        {
            ErrorOr<UrlRedirect> validResult = Valid(item);
            if (validResult.HasError)
            {
                return validResult;
            }

            ErrorOr<UrlRedirect> result = base.Add(item);
            if (!result.HasError)
            {
                RemoveCache();
            }
            return result;
        }
        public override ErrorOr<UrlRedirect> AddRange(params UrlRedirect[] items)
        {
            ErrorOr<UrlRedirect> result = base.AddRange(items);
            if (!result.HasError)
            {
                RemoveCache();
            }
            return result;
        }

        public override ErrorOr<UrlRedirect> Update(UrlRedirect item)
        {
            ErrorOr<UrlRedirect> validResult = Valid(item);
            if (validResult.HasError)
            {
                return validResult;
            }
            ErrorOr<UrlRedirect> result = base.Update(item);
            if (!result.HasError)
            {
                RemoveCache();
            }
            return result;
        }
        public override ErrorOr<UrlRedirect> UpdateRange(params UrlRedirect[] items)
        {
            ErrorOr<UrlRedirect> result = base.UpdateRange(items);
            if (!result.HasError)
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
            return _cacheManager.GetOrCreate(CacheKey, factory =>
            {
                return Get(m => m.Status == (int)RecordStatus.Active)
                .Select(m =>
                {
                    m.ParsePattern();
                    return m;
                }).ToList();
            });
        }

        public UrlRedirect GetMatchedRedirection(string path)
        {
            return GetAll().FirstOrDefault(m => m.IsMatch(path));
        }
    }
}
